//
//  TableExtension.swift
//  SearchBar
//
//  Created by Uladzislau Daratsiuk on 9/9/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredArray.count
        }else{
            return tempArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var device: String?
        if isSearching {
            device = filteredArray[indexPath.row]
        }else{
            device = tempArray[indexPath.row]
        }
        let cell = mainTable.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as UITableViewCell
        cell.textLabel?.text = device
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if mainSearchBar.text == nil || mainSearchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            mainTable.reloadData()
        }else{
            isSearching = true
            filteredArray = tempArray.filter({$0.range(of: mainSearchBar.text!, options: .caseInsensitive) != nil })
            mainTable.reloadData()
        }
    }

}
