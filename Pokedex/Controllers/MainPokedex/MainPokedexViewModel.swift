//
//  MainPokedexViewModel.swift
//  Pokedex
//
//  Created by Felipe on 12/04/22.
//

import Foundation
import Combine

class MainPokedexViewModel {
    var pokemonList: PokemonListModel?
    var reloadPassthrough = PassthroughSubject<Void, Never>()
    
    func loadPokemonList() {
        APIServices().pokemonList() {[weak self] response, error in
            if error != nil {
                print("Error with the API")
            } else {
                self?.pokemonList = response
                self?.reloadPassthrough.send()
            }
        }
    }
    
}
