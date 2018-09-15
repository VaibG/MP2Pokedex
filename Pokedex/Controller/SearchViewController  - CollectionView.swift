//
//  MultipleViewController - CollectionView.swift
//  Pokedex
//
//  Created by Vaibhav Gattani on 14/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonTypeImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = typeCollection.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as! TypeCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.typeImageView.image = pokemonTypeImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: typeLabel.frame.width/4, height: typeLabel.frame.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("WOOOOOO")
        let cell = typeCollection.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as! TypeCell
        cell.alpha = 0.5
        cell.contentView.alpha = 0.5
        selectedTypes.append(pokemonTypeNames[indexPath.row])
        collectionView.reloadData()
        print(selectedTypes[0])
    }
    
}
