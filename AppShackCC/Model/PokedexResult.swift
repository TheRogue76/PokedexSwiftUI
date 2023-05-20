//
//  PokedexResult.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//

import Foundation

struct PokedexResult: Decodable {
    let count: Int
    let results: [BaseNameURL]
}
