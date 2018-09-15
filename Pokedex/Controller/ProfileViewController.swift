//
//  ProfileViewController.swift
//  MP2-Pokedex
//
//  Created by Kiana Go on 9/11/18.
//  Copyright © 2018 Kiana Go. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var pokemon: Pokemon!
    var titleLabel: UILabel!
    var backgroundImageView: UIImageView!
    var pokemonName: UILabel!
    var pokemonImageView: UIImageView!
    var pokemonImage: UIImage!
    var searchWebButton: UIButton!
    var addtoFavButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = pokemon.name
        setupBackground()
        makeWebButton()
        makeFavButton()
        title()
        createLabel()
        createImage()
    }
    
    func setupBackground() {
        backgroundImageView = UIImageView(frame: view.frame)
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        view.addSubview(backgroundImageView)
    }

    @objc func gotoWebsite(){
        if let link = URL(string: "https://google.com/search?q=\(pokemon.name.components(separatedBy: " ")[0].lowercased())") {
            print("Opening URL")
            UIApplication.shared.open(link)
        }
    }
    
    func makeWebButton() {
        searchWebButton = UIButton(frame: CGRect(x: 10, y: view.frame.maxY - 650, width: 2*view.frame.width/5 + 10, height: 40))
        searchWebButton.layer.cornerRadius = 20
        searchWebButton.setTitle("Search Web", for: .normal)
        searchWebButton.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 20.0)
        searchWebButton.backgroundColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        view.addSubview(searchWebButton)
        searchWebButton.addTarget(self, action: #selector(gotoWebsite), for: .touchUpInside)
        
    }
    
    func makeFavButton() {
        addtoFavButton = UIButton(frame: CGRect(x: 230, y: view.frame.maxY - 650, width: 2*view.frame.width/5 + 10, height: 40))
        addtoFavButton.layer.cornerRadius = 20
        addtoFavButton.setTitle("Add to Favorites", for: .normal)
        addtoFavButton.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 20.0)
        addtoFavButton.backgroundColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        addtoFavButton.titleLabel?.adjustsFontSizeToFitWidth = true
        view.addSubview(addtoFavButton)
        //addtoFavButton.addTarget(self, action: #selector(), for: .touchUpInside)
        
    }
    
    
    func createImage() {
        pokemonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.width/2))
        pokemonImageView.center = CGPoint(x: view.frame.width/2, y: (navigationController?.navigationBar.frame.maxY)! + 245)
        getImage()
        pokemonImageView.image = pokemonImage
        view.addSubview(pokemonImageView)
    }
    
    func title() {
        titleLabel = UILabel(frame: CGRect(x: 0, y: 135, width: view.frame.width, height: 60))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont (name: "Copperplate-Bold", size: 25)
        titleLabel.textColor = .black
        titleLabel.text = "\(pokemon.name!)"
        titleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(titleLabel)
    }
    
    func createLabel() {
        
        let typeLabel = UILabel(frame: CGRect(x: 20, y: 500, width: view.frame.width/2, height: 50))
        typeLabel.text = "Type: \n"
        for x in pokemon.types {
            typeLabel.text?.append(x + " ")
        }
        typeLabel.numberOfLines = 0
        
        let IDLabel = UILabel(frame: CGRect(x: 20, y: 570, width: view.frame.width/2, height: 50))
        IDLabel.text = "ID: \(pokemon.number!)"
        
        let speciesLabel = UILabel(frame: CGRect(x: 20, y: 640, width: view.frame.width/2, height: 50))
        speciesLabel.text = "Species: \n\(pokemon.species!)"
        speciesLabel.numberOfLines = 0
        
        
        let HPLabel = UILabel(frame: CGRect(x: view.frame.width/2 + 35, y: 500, width: view.frame.width/2, height: 30))
        HPLabel.text = "HP: \(pokemon.health!)"
        
        let attackLabel = UILabel(frame: CGRect(x: view.frame.width/2 + 35, y: 530, width: view.frame.width/2, height: 30))
        attackLabel.text = "Attack: \(pokemon.attack!)"
        
        let defenseLabel = UILabel(frame: CGRect(x: view.frame.width/2 + 35, y: 565, width: view.frame.width/2, height: 30))
        defenseLabel.text = "Defense: \(pokemon.defense!)"
        
        let spAtkLabel = UILabel(frame: CGRect(x: view.frame.width/2 + 35, y: 595, width: view.frame.width/2, height: 30))
        spAtkLabel.text = "Sp. Def: \(pokemon.specialAttack!)"
        
        let spDefLabel = UILabel(frame: CGRect(x: view.frame.width/2 + 35, y: 625, width: view.frame.width/2, height: 30))
        spDefLabel.text = "Sp. Atk: \(pokemon.specialDefense!)"
        
        let speedLabel = UILabel(frame: CGRect(x: view.frame.width/2 + 35, y: 660, width: view.frame.width/2, height: 30))
        speedLabel.text = "Speed: \(pokemon.speed!)"
        
        let totalLabel = UILabel(frame: CGRect(x: view.frame.width/2 + 35, y: 695, width: view.frame.width/2, height: 30))
        totalLabel.text = "Total: \(pokemon.total!)"
    
        
        for label in [typeLabel, IDLabel, speciesLabel] {
            label.font = UIFont(name: "Copperplate-Bold", size: 24)
            label.adjustsFontSizeToFitWidth = true
            view.addSubview(label)
        }
        
        for label in [HPLabel, attackLabel, defenseLabel, spAtkLabel, spDefLabel, speedLabel, totalLabel] {
            label.font = UIFont(name: "Copperplate-Bold", size: 18)
            view.addSubview(label)
        }
    }

    func getImage() {
        let url = URL(string: pokemon.imageUrl)
        let data = try? Data(contentsOf: url!)
        if let retrivedData = data {
            self.pokemonImage = UIImage(data: retrivedData)
        } else {
            self.pokemonImage = #imageLiteral(resourceName: "Pokeball")
        }
    }

    
}
