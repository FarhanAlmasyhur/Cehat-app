//
//  MenuPageViewController.swift
//  Cehat
//
//  Created by Arief Ramadhan on 16/06/22.
//

import UIKit

class MenuPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuPageCollectionViewCell
        cell.photoMenu.image = UIImage(named: menuImages[indexPath.row])
        cell.nameMenu.text = menuNames[indexPath.row]
        cell.totalFat.text = viewTotalFat[indexPath.row]
        cell.totalCarbo.text = viewTotalCarbo[indexPath.row]
        cell.totalCalory.text = viewTotalCalory[indexPath.row]
        cell.totalProtein.text = viewTotalProtein[indexPath.row]
        
        return cell
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var viewSegmented: UIView!
    @IBOutlet weak var nameEmpty: UILabel!
    @IBOutlet weak var imageEmpty: UIImageView!
    
    @IBAction func didSegmentedTap(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.nameEmpty.isHidden = true
            self.imageEmpty.isHidden = true
            self.menuCollectionView.isHidden = false
        }
        if sender.selectedSegmentIndex == 1 {
            self.nameEmpty.isHidden = false
            self.imageEmpty.isHidden = false
            self.menuCollectionView.isHidden = true
            nameEmpty.text = "Anda belum menambahkan menu ke favorit"
            imageEmpty.image = UIImage(systemName: "heart")
            
            viewSegmented.backgroundColor = .white
        }
        if sender.selectedSegmentIndex == 2 {
            self.nameEmpty.isHidden = false
            self.imageEmpty.isHidden = false
            self.menuCollectionView.isHidden = true
            nameEmpty.text = "Anda belum menambahkan menu harian, ayo mulai memberikan menu harian untuk memenuhi kebutuhan nutrisi anak"
            imageEmpty.image = UIImage(systemName: "clock.arrow.circlepath")
            
            viewSegmented.backgroundColor = .white
        }
    }
    
    var menuImages:[String] = ["Stim_Ikan","Tumis_Kangkung","Nasi_Goreng","Salad"]
    var menuNames:[String] = ["Nasi Goreng","Baso Sapi","Indomie Goreng","Indomie Rebus"]
    var viewTotalCalory:[String] = ["100gr","50gr","40gr","80gr"]
    var viewTotalCarbo:[String] = ["100gr","50gr","40gr","80gr"]
    var viewTotalProtein:[String] = ["100gr","50gr","40gr","80gr"]
    var viewTotalFat:[String] = ["100gr","50gr","40gr","80gr"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.searchTextField.layer.masksToBounds = true

        let nibCell = UINib(nibName: "MenuPageCollectionViewCell", bundle: nil)
        menuCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
             //Do your logic here

        }

}
