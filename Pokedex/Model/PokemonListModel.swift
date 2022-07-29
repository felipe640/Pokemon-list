//
//  PokemonListModel.swift
//  Pokedex
//
//  Created by Felipe on 12/04/22.
//

import Foundation

struct PokemonListModel: Codable {
    let count: Int
    let next: String
    let results: [PokemonModel]
}
