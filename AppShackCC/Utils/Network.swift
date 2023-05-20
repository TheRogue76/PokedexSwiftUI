//
//  Network.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import Foundation

class Network {
    static let shared = Network()
    
    private let baseURL = URL(string: "https://pokeapi.co/api/v2")!
}

//MARK: generic function for fetching data and decoding it
enum DataFetchError: Error {
    case badURL
    case requestFailed(Error)
    case decodingFailed(Error)
}

func fetchData<T: Decodable>(from url: URL, responseType: T.Type) async throws -> T {
    let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
    let (data, response) = try await URLSession.shared.data(for: request)
    guard let httpResponse = response as? HTTPURLResponse else {
        print(response)
        throw DataFetchError.requestFailed(NSError(domain: NSURLErrorDomain, code: NSURLErrorBadServerResponse))
    }
    guard 200...299 ~= httpResponse.statusCode else {
        print(httpResponse)
        throw DataFetchError.requestFailed(NSError(domain: NSURLErrorDomain, code: httpResponse.statusCode))
    }
    do {
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    } catch {
        throw DataFetchError.decodingFailed(error)
    }
}

//MARK: The API calls
extension Network {
    func getAllPokemon() async throws -> PokedexResult {
        let path = Endpoints.getAllPokemon.path
        let url = baseURL.appending(path: path).appending(queryItems: [URLQueryItem(name: "limit", value: "10000")])
        return try await fetchData(from: url, responseType: PokedexResult.self)
    }
    
    func getPokemonByURL(url: String) async throws -> Pokemon {
        guard let url = URL(string: url) else {
            throw DataFetchError.badURL
        }
        return try await fetchData(from: url, responseType: Pokemon.self)
    }
    
    func getPokemonById(id: Int) async throws -> Pokemon {
        let path = Endpoints.getPokemonById(id).path
        let url = baseURL.appending(path: path)
        return try await fetchData(from: url, responseType: Pokemon.self)
    }
}
