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
    @IBOutlet weak var collectionView: UICollectionView!
    
    let menuSeeder: MenuSeeder = MenuSeeder()
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu = menuSeeder.menu2
        // Do any additional setup after loading the view.
        setupView()
        setupCollectionView()
    }
    
    func setupView(){
        menuDetail.layer.cornerRadius = 20
        listBahan.attributedText = BulletListHelper.createBulletedList(fromStringArray: menu?.ingredients ?? ["Label"])
        caraMasak.attributedText = BulletListHelper.createBulletedList(fromStringArray: menu?.cookStep ?? ["Label"], isNumbered: true)
        caraMasak.textAlignment = .justified
    }
    
    func setupCollectionView(){
        collectionView.dataSource = self
        
    }

}


