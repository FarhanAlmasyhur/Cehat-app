//
//  MenuPageViewController + SearchBar.swift
//  Cehat
//
//  Created by Arief Ramadhan on 24/06/22.
//

import UIKit

extension MenuPageViewController: UISearchBarDelegate  {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMenuNames = []
        
        if searchText == "" {
            filteredMenuNames = menuNames
        }
        else{
            for name in menuNames {
                if name.lowercased().contains(searchText.lowercased()) {
                    filteredMenuNames.append(name)
                }
            }
        }
        
        self.menuCollectionView.reloadData()
    }
    
}
