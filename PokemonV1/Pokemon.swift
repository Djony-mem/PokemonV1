//
//  Pokemon.swift
//  PokemonV1
//
//  Created by brubru on 12.10.2022.
//

import Foundation

struct PokemonApp: Decodable {
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}

struct Character: Decodable {
    let sprites: Sprites
}

struct Sprites: Decodable {
    let other: Home
}

struct Home: Decodable {
    let home: Front
}

struct Front: Decodable {
    let front_default: String
}
