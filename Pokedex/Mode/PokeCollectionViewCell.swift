//
//  PokeCollectionViewCell.swift
//  Pokedex
//
//  Created by Vaibhav Gattani on 14/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

class PokeCollectionViewCell: UICollectionViewCell {
    
    var pokemonImageView: UIImageView!
    var pokemonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokemonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height - 20))
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.clipsToBounds = true
        contentView.addSubview(pokemonImageView)
        
        pokemonLabel = UILabel(frame: CGRect(x: 0, y: contentView.frame.height - 15, width: contentView.frame.width, height: 15))
        pokemonLabel.textAlignment = .center
        pokemonLabel.font = UIFont(name: "Copperplate-Bold", size: 14)
        contentView.addSubview(pokemonLabel)
    }
    
    
}
