//
//  Pokemon.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//
import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    let id: Int
    let name: String
    let abilities: [AbilityElement]
    let baseExperience: Int?
    let height: Int
    let order: Int
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case height, id, name, order, sprites, stats, types, weight
    }
    
    static var dummy = Pokemon(id: 1, name: "bulbasaur", abilities: [AbilityElement(ability: BaseNameURL(name: "overgrow", url: "https://pokeapi.co/api/v2/ability/65/"), isHidden: false, slot: 1)], baseExperience: 64, height: 7, order: 1, sprites: Sprites(backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png", backFemale: nil, backShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png", backShinyFemale: nil, frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", frontFemale: nil, frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png"), stats: [Stat(baseStat: 45, effort: 0, stat: BaseNameURL(name: "hp", url: "https://pokeapi.co/api/v2/stat/1/"))], types: [TypeElement(slot: 1, type: BaseNameURL(name: "grass", url: "https://pokeapi.co/api/v2/type/12/"))], weight: 69)
}

// MARK: - AbilityElement
struct AbilityElement: Codable {
    let ability: BaseNameURL?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Sprites
struct Sprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?
    let stat: BaseNameURL?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int?
    let type: BaseNameURL?
}

