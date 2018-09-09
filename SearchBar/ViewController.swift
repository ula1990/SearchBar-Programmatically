//
//  ViewController.swift
//  SearchBar
//
//  Created by Uladzislau Daratsiuk on 9/9/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellId = "cellId"
    var tempArray = ["iPhone", "Macbook", "iPad", "iMac", "AirPods", "Apple Watch"]
    var filteredArray = [String]()
    var isSearching = false
    
    lazy var mainTable: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return table
    }()
    
    let mainSearchBar = MainSearchBar()
    
    fileprivate func setupView(){
        view.addSubview(mainSearchBar)
        view.addSubview(mainTable)
        
        mainSearchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        mainSearchBar.heightAnchor.constraint(equalToConstant: 200).isActive = true
        mainSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    
        mainTable.topAnchor.constraint(equalTo: mainSearchBar.bottomAnchor, constant: 10).isActive = true
        mainTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        mainTable.delegate = self
        mainTable.dataSource = self
        mainSearchBar.delegate = self
        mainSearchBar.returnKeyType = UIReturnKeyType.done
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
    }


}

