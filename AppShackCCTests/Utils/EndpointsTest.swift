//
//  EndpointsTest.swift
//  AppShackCCTests
//
//  Created by Parsa on 2023-05-21.
//

@testable import AppShackCC
import XCTest

final class EndpointsTest: XCTestCase {
    func test_returns_correct_string_for_all_pokemon() -> Void {
        XCTAssertEqual(Endpoints.getAllPokemon.path, "/pokemon")
    }
    
    func test_returns_correct_string_for_pokemon_by_id() -> Void {
        XCTAssertEqual(Endpoints.getPokemonById(12).path, "/pokemon/12")
    }
}
