//
//  PokemonViewCell.swift
//  PokemonV1
//
//  Created by brubru on 12.10.2022.
//

import UIKit

class PokemonViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var pokemonImageView: UIImageView!
    
    func configur(pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        NetworkManager.shared.fetch(dataType: Character.self, url: pokemon.url) { character in
            NetworkManager.shared.fetchImage(from: character.sprites.other.home.front_default) { data in
                self.pokemonImageView.image = UIImage(data: data)
            }
        }
    }
}
