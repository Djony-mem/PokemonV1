//
//  NetworkManager.swift
//  PokemonV1
//
//  Created by brubru on 12.10.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum List: String {
    case url = "https://pokeapi.co/api/v2/pokemon"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(dataType: T.Type, url: String, completion: @escaping(T) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let type = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(type)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchImage(from url: String, completion: @escaping(Data) -> Void) {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
    
}
