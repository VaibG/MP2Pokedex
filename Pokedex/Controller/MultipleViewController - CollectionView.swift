//
//  MultipleViewController - CollectionView.swift
//  Pokedex
//
//  Created by Vaibhav Gattani on 14/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

extension MultipleViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCollectionCell", for: indexPath) as! PokeCollectionViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.pokemonImageView.image = getImage(targetImage: searchedPokemon[indexPath.row].imageUrl)
        cell.pokemonLabel.text = searchedPokemon[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/4, height: view.frame.height/6)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPokemon = searchedPokemon[indexPath.row]
        performSegue(withIdentifier: "pokeClicked", sender: nil)
    }
    
    func getImage(targetImage: String) -> UIImage {
        if let url = URL(string: targetImage) {
            let data = try? Data(contentsOf: url)
            if let retrivedData = data {
                return UIImage(data: retrivedData)!
            } else {
                return #imageLiteral(resourceName: "Pokeball")
            }
        } else {
            return #imageLiteral(resourceName: "Pokeball")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfileViewController {
            destination.pokemon = selectedPokemon
        }
    }

    
    


}
