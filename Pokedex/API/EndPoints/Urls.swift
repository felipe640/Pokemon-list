//
//  Urls.swift
//  Pokedex
//
//  Created by Felipe on 12/04/22.
//

import Foundation

struct Url {
    static let baseUrl = "https://pokeapi.co/api/v2/"
    static let pokemonListPath = "pokemon?limit=151"
    static let pokemonImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    
    static func pokemonImage(index: Int) -> String {
        return Url.pokemonImage + "\((index + 1))" + ".png"
    }
}
