//
//  ViewController.swift
//  ScrollableView
//
//  Created by Muhammad Farhan Almasyhur on 16/06/22.
//

import UIKit

class DetailMenuViewController: UIViewController {

    @IBOutlet weak var menuDetail: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var listBahan: UILabel!
    @IBOutlet weak var caraMasak: UILabel!
    @IBOutlet weak var nutritionCountCell: UICollectionView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    let menuSeeder: MenuSeeder = MenuSeeder()
    var menu: Menu?
    let menuHistoryManager: MenuHistoryRepository = CoreDataHistoryManager()
    let menuFavoriteManager: MenuFavoriteRepository = CoreDataFavoriteManager()
    var favoritedMenu: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
    }
    
    
    //MARK: - Setup View
    func setupView(){
        guard let menu = menu else { return }
        menuName.text = menu.name
        menuDetail.layer.cornerRadius = 20
        listBahan.attributedText = BulletListHelper.createBulletedList(fromStringArray: menu.ingredients)
        caraMasak.attributedText = BulletListHelper.createBulletedList(fromStringArray: menu.cookStep, isNumbered: true)
        caraMasak.textAlignment = .justified
        menuImage.image = UIImage(named: menu.image)
        menuImage.circleView()
        checkFavorited()
    }
    
    
    func setupCollectionView(){
        let nibCell = UINib(nibName: "NutrientsCountCollectionViewCell", bundle: nil)
        nutritionCountCell.register(nibCell, forCellWithReuseIdentifier: "NutritionCountCell")
        nutritionCountCell.dataSource = self
    }
    
    func checkFavorited(){
        favoritedMenu = menuFavoriteManager.checkFavorited(idMenu: menu?.id ?? -1)
        DispatchQueue.main.async {
            if self.favoritedMenu {
                self.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                self.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    
    // MARK: - Action
    @IBAction func addMenu(_ sender: Any) {
        let alert = UIAlertController(title: "Perhatian", message: "Pastikan takaran bahan yang digunakan sesuai karena akan berpengaruh pada jumlah kalorinya", preferredStyle: .alert)
        let okeButtonAction = UIAlertAction(title: "Oke", style: UIAlertAction.Style.default, handler: {action in
            let _ = self.menuHistoryManager.addToHistory(idMenu: self.menu?.id ?? -1)
        })
        
        // change title color
        okeButtonAction.setValue(UIColor.myDarkGreen, forKey: "titleTextColor")
        
        // add the action for Alert
        alert.addAction(okeButtonAction)

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        if favoritedMenu {
            menuFavoriteManager.deleteFromFavorite(idMenu: self.menu?.id ?? -1)
            checkFavorited()
        } else {
            menuFavoriteManager.addToFavorite(idMenu: self.menu?.id ?? -1)
            checkFavorited()
        }
    }
    
}


