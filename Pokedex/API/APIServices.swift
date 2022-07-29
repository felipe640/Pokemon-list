//
//  APIServices.swift
//  Pokedex
//
//  Created by Felipe on 12/04/22.
//

import Foundation

protocol Endpoint {
    var httpMethod: String { get }
    var baseURLString: String { get }
    var path: String { get }
}

extension Endpoint {
    // a default extension that creates the full URL
    var url: String {
        return baseURLString + path
    }
}

enum EndpointCases: Endpoint {
    
    case getPokemonList
    
    var httpMethod: String {
        switch self {
        case .getPokemonList:
            return "GET"
        }
    }
    
    var baseURLString: String {
        switch self {
        case .getPokemonList:
            return Url.baseUrl
        }
    }
    
    var path: String {
        switch self {
        case .getPokemonList:
            return Url.pokemonListPath
        }
    }
    
}

class APIServices {
    func pokemonList(completion: @escaping (PokemonListModel?, Error?) -> Void) {
        let endpoint = EndpointCases.getPokemonList
        
        request(endpoint: endpoint) { response, error in
            completion(response, error)
        }
    }
    
    private func request(endpoint: Endpoint, completion: @escaping (PokemonListModel?, Error?) -> Void) {
        guard let url = URL(string: endpoint.url) else {
            completion(nil, nil)
            return
        }
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.httpMethod
        
        session.dataTask(with: urlRequest) { data, response, error in

            guard let model = try? JSONDecoder().decode(PokemonListModel.self, from: data!) else {
                completion(nil, error)
                return
            }
            completion(model, error)
        }.resume()
    }
}
