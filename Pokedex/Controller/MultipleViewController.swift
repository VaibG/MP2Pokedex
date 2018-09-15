//
//  MultipleViewController.swift
//  Pokedex
//
//  Created by Vaibhav Gattani on 13/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

class MultipleViewController: UIViewController {
    
    var gridView: UICollectionView!
    var listView: UITableView!
    var switchControl: UISegmentedControl!
    
    var searchedPokemon: [Pokemon]!
    var selectedPokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        createTableView()
        setSegmentControlProperties()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        gridView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        gridView.dataSource = self
        gridView.delegate = self
        gridView.backgroundColor = .white
        gridView.register(PokeCollectionViewCell.self, forCellWithReuseIdentifier: "pokeCollectionCell")
        view.addSubview(gridView)

    }
    
    func createTableView() {
        listView = UITableView(frame: view.frame)
        listView.delegate = self
        listView.dataSource = self
        listView.register(PokeTableViewCell.self, forCellReuseIdentifier: "pokeTableCell")
    }
    
    func setSegmentControlProperties() {
        switchControl = UISegmentedControl(items: ["Grid", "List"])
        switchControl.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        switchControl.addTarget(self, action: #selector(switchView), for: .valueChanged)
        navigationItem.titleView = switchControl
        switchControl.selectedSegmentIndex = 0
    }
    
    @objc func switchView(){
        if switchControl.selectedSegmentIndex == 1{
            gridView.removeFromSuperview()
            view.addSubview(listView)
        }
        else{
            listView.removeFromSuperview()
            view.addSubview(gridView)
        }
    }
}

