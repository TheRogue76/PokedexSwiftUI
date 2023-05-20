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
    case requestFailed(Error)
    case decodingFailed(Error)
}

func fetchData<T: Decodable>(from url: URL, responseType: T.Type) async throws -> T {
    let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
    let (data, response) = try await URLSession.shared.data(for: request)
    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
        throw DataFetchError.requestFailed(NSError(domain: NSURLErrorDomain, code: NSURLErrorBadServerResponse))
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
    func getPokemonCount() async throws -> Count {
        let path = Endpoints.getCountOfPokemon.path
        let url = baseURL.appending(path: path).appending(queryItems: [URLQueryItem(name: "limit", value: "1")])
        return try await fetchData(from: url, responseType: Count.self)
    }
    
    func getPokemonById(id: Int) async throws -> Pokemon {
        let path = Endpoints.getPokemonById(id).path
        let url = baseURL.appending(path: path)
        return try await fetchData(from: url, responseType: Pokemon.self)
    }
}
