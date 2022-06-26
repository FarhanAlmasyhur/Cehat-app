//
//  MenuPageViewController.swift
//  Cehat
//
//  Created by Arief Ramadhan on 16/06/22.
//

import UIKit

class MenuPageViewController: UIViewController {
    
    var arrayMenu: [Menu] = []
    let seeder: MenuSeeder = MenuSeeder()
    var menuImages:[String] = ["Stim_Ikan","Tumis_Kangkung","Nasi_Goreng","Salad","Salad","Salad"]
    var menuNames: [String] = []
    var viewTotalCalory: [Double] = []
    var viewTotalCarbo: [Double] = []
    var viewTotalProtein: [Double] = []
    var viewTotalFat: [Double] = []
    var filteredMenuNames: [String]!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArray()
        
        //regis xib
        let nibCell = UINib(nibName: "MenuPageCollectionViewCell", bundle: nil)
        menuCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
    }
//    override func viewWillAppear(_ animated: Bool) {
//            navigationController?.setNavigationBarHidden(true, animated: animated)
//        }
    
    
    func setupArray(){
        
        arrayMenu = seeder.getAllMenu()
        filteredMenuNames = arrayMenu.map{$0.name}
        viewTotalCalory = arrayMenu.map{$0.nutrients[.calories]}
        viewTotalFat = arrayMenu.map{$0.nutrients[.fat]}
        viewTotalCarbo = arrayMenu.map{$0.nutrients[.carbohydrate]}
        viewTotalProtein = arrayMenu.map{$0.nutrients[.protein]}
        
        //sarchbar
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.delegate = self
        
    }
}
