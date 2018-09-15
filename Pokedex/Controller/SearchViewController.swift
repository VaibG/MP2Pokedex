//
//  SearchViewController.swift
//  Pokedex
//
//  Created by Vaibhav Gattani on 11/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    //Pokemon
    var pokemonArray: [Pokemon]!
    var favorites: [Pokemon]!
    var openPokemonProfile: Pokemon!
    var move: Bool!
    var selectedTypes: [String]!
    
    //Searched Pokemon
    var rands: [Int]!
    var searchedPokemon: [Pokemon]!
    
    
    //Search Variables
    var pokeSearchBar: UISearchBar!
    var pokeSearchText: String!
    
    //Buttons and Labels
    var randomButton: UIButton!
    var searchButton: UIButton!
    var minAttackPointsLabel: UITextView!
    var minAttackPoints: UITextField!
    var minDefensePointsLabel: UITextView!
    var minDefensePoints: UITextField!
    var minHealthPointsLabel: UITextView!
    var minHealthPoints: UITextField!
    var typeLabel: UITextView!
    var titleLabel: UILabel!
    var footerLabel: UILabel!
    
    //Attributes
    var minAttack: Int!
    var minDefense: Int!
    var minHealth: Int!
    
    //Background
    var backgroundImageView: UIImageView!
    
    //collectionview
    var typeCollection: UICollectionView!
    var pokemonTypeNames: [String]!
    var pokemonTypeImages: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTypeNames = ["bug", "grass", "dark", "ground", "dragon", "ice", "electric", "normal", "fairy", "poison", "fighting", "psychic", "fire", "rock", "flying", "steel", "ghost", "water"]
        pokemonTypeImages = [#imageLiteral(resourceName: "bug"), #imageLiteral(resourceName: "grass"), #imageLiteral(resourceName: "dark"), #imageLiteral(resourceName: "ground"), #imageLiteral(resourceName: "dragon"), #imageLiteral(resourceName: "ice"), #imageLiteral(resourceName: "electric"), #imageLiteral(resourceName: "normal"), #imageLiteral(resourceName: "fairy"), #imageLiteral(resourceName: "poison"), #imageLiteral(resourceName: "fighting"), #imageLiteral(resourceName: "psycic"), #imageLiteral(resourceName: "fire"), #imageLiteral(resourceName: "rock"), #imageLiteral(resourceName: "steel"), #imageLiteral(resourceName: "ghost"), #imageLiteral(resourceName: "water")]

        minAttack = 0
        minDefense = 0
        minHealth = 0
        favorites = []
        rands = []
        selectedTypes = []
        move = false
        pokemonArray = PokemonGenerator.getPokemonArray()
        searchedPokemon = PokemonGenerator.getPokemonArray()
        createBoxes()
        createSearch()
        createRandomButton()
        createSearchButton()
        createTextFields()
        setupBackground()
        createCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        typeCollection = UICollectionView(frame: CGRect(x: typeLabel.frame.minX, y: typeLabel.frame.minY + 30, width: typeLabel.frame.width, height: typeLabel.frame.height - 30), collectionViewLayout: layout)
        typeCollection.dataSource = self
        typeCollection.delegate = self
        typeCollection.backgroundColor = .white
        typeCollection.register(TypeCell.self, forCellWithReuseIdentifier: "typeCell")
        view.addSubview(typeCollection)
        view.bringSubview(toFront: typeCollection)
        
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        pokeSearchText = pokeSearchBar.text
        keyboardGone()
        pokeSearchBar.text = ""
        generateSearchWithText()
    }
    
    func generateSearchWithText() {
        if let _ = searchedPokemon {
            searchedPokemon.removeAll()
        }
        if pokeSearchText != "" {
            for pokemon in pokemonArray {
                if pokemon.name.lowercased() == pokeSearchText.lowercased() || Int(pokeSearchText) == pokemon.number {
                    openPokemonProfile = pokemon
                    performSegue(withIdentifier: "exactSearch", sender: nil)
                    return
                }
                else if pokemon.name.lowercased().contains(pokeSearchText.lowercased()) {
                    searchedPokemon.append(pokemon)
                    move = true
                }
            }
            if move{
                performSegue(withIdentifier: "multipleResults", sender: nil)
            }
            else {
                sendAlert("No Pokemon Matching Criteria")
            }
        }
        else {
            generateSearchWithButton()
        }
    }
    
    @objc func generateRandomPokemon() {
        if let _ = searchedPokemon {
            searchedPokemon.removeAll()
        }
        var x = Set<Int>()
        while x.count < 20 {
            let random = arc4random_uniform(UInt32(pokemonArray.count))
            x.insert(Int(random))
        }
        for i in x {
                searchedPokemon.append(pokemonArray[i])
            }
        performSegue(withIdentifier: "multipleResults", sender: nil)
        
    }
    
    @objc func generateSearchWithButton() {
        if let _ = searchedPokemon {
            searchedPokemon.removeAll()
        }
        if minAttackPoints.text == "" {
            minAttack = 0
        } else {
            minAttack = Int(minAttackPoints.text!)
            if minAttack > 200 {
                sendAlert("Minimum Attack Above 200")
                minAttackPoints.text = ""
            }
        }
        
        if minDefensePoints.text == "" {
            minDefense = 0
        } else {
            minDefense = Int(minDefensePoints.text!)
            if minDefense > 200 {
                sendAlert("Minimum Defense Above 200")
                minDefensePoints.text = ""
            }
        }
        if minHealthPoints.text == "" {
            minHealth = 0
        } else {
            minHealth = Int(minHealthPoints.text!)
            if minHealth > 200 {
                sendAlert("Minimum Health Above 200")
                minHealthPoints.text = ""
            }
        }
        for pokemon in pokemonArray {
            if pokemon.attack > minAttack && pokemon.defense > minDefense && pokemon.health > minHealth {
                if selectedTypes.isEmpty {
                    searchedPokemon.append(pokemon)
                    move = true
                } else {
                    for x in selectedTypes {
                        for y in pokemon.types {
                            if x.lowercased() == y.lowercased() {
                                searchedPokemon.append(pokemon)
                                move = true
                            }
                        }
                    }
                }
            }
        }
        
        if move {
            performSegue(withIdentifier: "multipleResults", sender: nil)
        }
        else {
            sendAlert("No Pokemon Matching Criteria")
        }
    }
    
    func sendAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfileViewController {
        destination.pokemon = openPokemonProfile
        }
        
        if let destination = segue.destination as? MultipleViewController {
        destination.searchedPokemon = searchedPokemon
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        keyboardGone()
    }
    
    @objc func keyboardGone(){
        navigationItem.titleView?.endEditing(true)
    }
    
}
