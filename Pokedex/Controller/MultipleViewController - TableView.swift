//
//  MultipleViewController - TableView.swift
//  Pokedex
//
//  Created by Vaibhav Gattani on 14/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

extension MultipleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedPokemon.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listView.dequeueReusableCell(withIdentifier: "pokeTableCell", for: indexPath) as! PokeTableViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.pokemonImageView.image = getImage(targetImage: searchedPokemon[indexPath.row].imageUrl)
        cell.pokemonLabel.text = searchedPokemon[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPokemon = searchedPokemon[indexPath.row]
        performSegue(withIdentifier: "pokeClicked", sender: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
