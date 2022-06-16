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
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    var menuImages:[String] = ["icon-calories","icon-karbo","icon-protein","icon-trans-fat"]
    var menuNames:[String] = ["Nasi Goreng","Baso Sapi","Indomie Goreng","Indomie Rebus"]
    var viewTotalCalory:[String] = ["100gr","50gr","40gr","80gr"]
    var viewTotalCarbo:[String] = ["100gr","50gr","40gr","80gr"]
    var viewTotalProtein:[String] = ["100gr","50gr","40gr","80gr"]
    var viewTotalFat:[String] = ["100gr","50gr","40gr","80gr"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibCell = UINib(nibName: "MenuPageCollectionViewCell", bundle: nil)
        menuCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
