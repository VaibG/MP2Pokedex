//
//  SearchViewController - UI Elements.swift
//  Pokedex
//
//  Created by Kiana Go on 9/14/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

extension SearchViewController {
    func setupBackground() {
        backgroundImageView = UIImageView(frame: view.frame)
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        self.view.sendSubview(toBack: backgroundImageView)
    }
    
    func createBoxes() {
        typeLabel = UITextView(frame: CGRect(x: view.frame.width/10 - 20, y: (navigationController?.navigationBar.frame.maxY)! + 140, width: 2*view.frame.width/5 + 10, height: 2*view.frame.width/5 + 10))
        typeLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        typeLabel.text = "Types"
        typeLabel.textAlignment = .center
        typeLabel.textColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        typeLabel.font = UIFont(name: "Copperplate-Bold", size: 18.0)
        typeLabel.layer.cornerRadius = 20
        typeLabel.isEditable = false
        view.addSubview(typeLabel)
        
        minAttackPointsLabel = UITextView(frame: CGRect(x: view.frame.width/2 + 10, y: (navigationController?.navigationBar.frame.maxY)! + 140, width: 2*view.frame.width/5 + 10, height: 2*view.frame.width/5 + 10))
        minAttackPointsLabel.text = "Minimum Attack \n Points"
        minAttackPointsLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        minAttackPointsLabel.textAlignment = .center
        minAttackPointsLabel.textColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        minAttackPointsLabel.font = UIFont(name: "Copperplate-Bold", size: 16.0)
        minAttackPointsLabel.layer.cornerRadius = 20
        minAttackPointsLabel.isEditable = false
        view.addSubview(minAttackPointsLabel)
        
        minDefensePointsLabel = UITextView(frame: CGRect(x: view.frame.width/10 - 20, y: (typeLabel.frame.maxY) + 20, width: 2*view.frame.width/5 + 10, height: 2*view.frame.width/5 + 10))
        minDefensePointsLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        minDefensePointsLabel.text = "Minimum Defense \n Points"
        minDefensePointsLabel.textAlignment = .center
        minDefensePointsLabel.textColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        minDefensePointsLabel.font = UIFont(name: "Copperplate-Bold", size: 16.0)
        minDefensePointsLabel.layer.cornerRadius = 20
        minDefensePointsLabel.isEditable = false
        view.addSubview(minDefensePointsLabel)
        
        minHealthPointsLabel = UITextView(frame: CGRect(x: view.frame.width/2 + 10, y: (typeLabel.frame.maxY) + 20, width: 2*view.frame.width/5 + 10, height: 2*view.frame.width/5 + 10))
        minHealthPointsLabel.text = "Minimum Health \n Points"
        minHealthPointsLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        minHealthPointsLabel.textAlignment = .center
        minHealthPointsLabel.textColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        minHealthPointsLabel.font = UIFont(name: "Copperplate-Bold", size: 16.0)
        minHealthPointsLabel.layer.cornerRadius = 20
        minHealthPointsLabel.isEditable = false
        view.addSubview(minHealthPointsLabel)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: (navigationController?.navigationBar.frame.maxY)! + 50, width: view.frame.width, height: 80))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(red: 0, green: 0.4275, blue: 0.8299, alpha: 1)
        titleLabel.text = "POKEDEX"
        titleLabel.font = UIFont(name: "Copperplate-Bold", size: 44.0)
        view.addSubview(titleLabel)
        
        footerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        footerLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.maxY - 20)
        footerLabel.textAlignment = .center
        footerLabel.textColor = .white
        footerLabel.text = "Gotta Catch Em All!"
        footerLabel.font = UIFont(name: "Copperplate-Bold", size: 24.0)
        //        footerLabel.backgroundColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        view.addSubview(footerLabel)
        
    }
    
    func createTextFields() {
        minAttackPoints = UITextField(frame: CGRect(x: minAttackPointsLabel.frame.midX, y: minAttackPointsLabel.frame.midY, width: 150, height: 30))
        minAttackPoints.center = CGPoint(x: minAttackPointsLabel.frame.midX, y: minAttackPointsLabel.frame.midY)
        minAttackPoints.placeholder = "Enter #: 0-200"
        minAttackPoints.textAlignment = .center
        view.addSubview(minAttackPoints)
        
        minDefensePoints = UITextField(frame: CGRect(x: minDefensePointsLabel.frame.midX, y: minDefensePointsLabel.frame.midY, width: 150, height: 30))
        minDefensePoints.center = CGPoint(x: minDefensePointsLabel.frame.midX, y: minDefensePointsLabel.frame.midY)
        minDefensePoints.placeholder = "Enter #: 0-200"
        minDefensePoints.textAlignment = .center
        view.addSubview(minDefensePoints)
        
        minHealthPoints = UITextField(frame: CGRect(x: minHealthPointsLabel.frame.midX, y: minHealthPointsLabel.frame.midY, width: 150, height: 30))
        minHealthPoints.center = CGPoint(x: minHealthPointsLabel.frame.midX, y: minHealthPointsLabel.frame.midY)
        minHealthPoints.placeholder = "Enter #: 0-200"
        minHealthPoints.textAlignment = .center
        view.addSubview(minHealthPoints)
        
    }
    
    func createSearch(){
        self.extendedLayoutIncludesOpaqueBars = true
        pokeSearchBar = UISearchBar()
        pokeSearchBar.delegate = self
        pokeSearchBar.sizeToFit()
        navigationItem.titleView = pokeSearchBar
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardGone))
        view.addGestureRecognizer(tap)
    }
    
    func createRandomButton(){
        randomButton = UIButton(frame: CGRect(x: view.frame.width/10 - 20, y: view.frame.maxY - 130, width: 2*view.frame.width/5 + 10, height: 50))
        randomButton.layer.cornerRadius = 20
        randomButton.setTitle("Random", for: .normal)
        randomButton.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 24.0)
        randomButton.backgroundColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        randomButton.addTarget(self, action: #selector(generateRandomPokemon), for: .touchUpInside)
        view.addSubview(randomButton)
    }
    
    func createSearchButton() {
        searchButton = UIButton(frame: CGRect(x: view.frame.width/2 + 10, y: view.frame.maxY - 130, width: 2*view.frame.width/5 + 10, height: 50))
        searchButton.layer.cornerRadius = 20
        searchButton.setTitle("Search", for: .normal)
        searchButton.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 24.0)
        searchButton.backgroundColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        searchButton.addTarget(self, action: #selector(generateSearchWithButton), for: .touchUpInside)
        view.addSubview(searchButton)
    }
}
