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
    var menuImages:[String] = []
    var menuNames: [String] = []
    var viewTotalCalory: [Double] = []
    var viewTotalCarbo: [Double] = []
    var viewTotalProtein: [Double] = []
    var viewTotalFat: [Double] = []
    var filteredMenuNames: [String]!
    var favoriteArray: [Menu] = []
    var historyArray: [Menu] = []
    let historyManager: MenuHistoryRepository = CoreDataHistoryManager()
    let favoriteManager: MenuFavoriteRepository = CoreDataFavoriteManager()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var viewSegmented: UIView!
    @IBOutlet weak var nameEmpty: UILabel!
    @IBOutlet weak var imageEmpty: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayMenu = seeder.getAllMenu()
        setupArray(menus: arrayMenu)
        
        //regis xib
        let nibCell = UINib(nibName: "MenuPageCollectionViewCell", bundle: nil)
        menuCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
    }
//    override func viewWillAppear(_ animated: Bool) {
//            navigationController?.setNavigationBarHidden(true, animated: animated)
//        }
    
    
    func setupArray(menus: [Menu]){
        filteredMenuNames = menus.map{$0.name}
        viewTotalCalory = menus.map{$0.nutrients[.calories]}
        viewTotalFat = menus.map{$0.nutrients[.fat]}
        viewTotalCarbo = menus.map{$0.nutrients[.carbohydrate]}
        viewTotalProtein = menus.map{$0.nutrients[.protein]}
        menuImages = menus.map{$0.image}
        
        //sarchbar
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.delegate = self
    }
    
    func deleteArray(){
        filteredMenuNames.removeAll()
        viewTotalCalory.removeAll()
        viewTotalFat.removeAll()
        viewTotalCarbo.removeAll()
        viewTotalProtein.removeAll()
        menuImages.removeAll()
    }

    
    
    @IBAction func didSegmentedTap(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            deleteArray()
            arrayMenu = seeder.getAllMenu()
            setupArray(menus: arrayMenu)
            self.nameEmpty.isHidden = true
            self.imageEmpty.isHidden = true
            self.menuCollectionView.isHidden = false
            menuCollectionView.reloadData()
        }
        if sender.selectedSegmentIndex == 1 {
            deleteArray()
            favoriteArray = favoriteManager.getFavoriteMenu() ?? []
            if favoriteArray.count == 0{
                self.nameEmpty.isHidden = false
                self.imageEmpty.isHidden = false
                self.menuCollectionView.isHidden = true
                nameEmpty.text = "Anda belum menambahkan menu ke favorit"
                imageEmpty.image = UIImage(systemName: "heart")
            } else {
                self.nameEmpty.isHidden = true
                self.imageEmpty.isHidden = true
                self.menuCollectionView.isHidden = false
                arrayMenu = favoriteArray
                setupArray(menus: arrayMenu)
                menuCollectionView.reloadData()
            }
            
            viewSegmented.backgroundColor = .white
            
        }
        if sender.selectedSegmentIndex == 2 {
            deleteArray()
            let dictionaryHistory = historyManager.getHistoryMenu()
            historyArray = dictionaryHistory?[Date.getTodaysDate()] ?? []
            if historyArray.count == 0{
                self.nameEmpty.isHidden = false
                self.imageEmpty.isHidden = false
                self.menuCollectionView.isHidden = true
                nameEmpty.text = "Anda belum menambahkan menu harian, ayo mulai memberikan menu harian untuk memenuhi kebutuhan nutrisi anak"
                imageEmpty.image = UIImage(systemName: "clock.arrow.circlepath")
            } else {
                self.nameEmpty.isHidden = true
                self.imageEmpty.isHidden = true
                self.menuCollectionView.isHidden = false
                arrayMenu = historyArray
                setupArray(menus: arrayMenu)
                menuCollectionView.reloadData()
            }
            
            
            viewSegmented.backgroundColor = .white
        }
    }
    
    
}
