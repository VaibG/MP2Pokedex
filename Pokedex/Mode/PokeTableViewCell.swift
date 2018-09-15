//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Vaibhav Gattani on 14/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

class PokeTableViewCell: UITableViewCell {
    
    var pokemonImageView: UIImageView!
    var pokemonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pokemonImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: contentView.frame.height, height: contentView.frame.height))
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.clipsToBounds = true
        contentView.addSubview(pokemonImageView)
        
        pokemonLabel = UILabel(frame: CGRect(x: pokemonImageView.frame.width + 10, y: 0, width: contentView.frame.width - contentView.frame.height - 10, height: 50))
        pokemonLabel.textAlignment = .left
        pokemonLabel.numberOfLines = 2
        pokemonLabel.font = UIFont(name: "Copperplate-Bold", size: 18)
        pokemonLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(pokemonLabel)
        
    }
    
}
