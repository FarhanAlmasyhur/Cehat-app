//
//  MenuPageViewController + CollectionView.swift
//  Cehat
//
//  Created by Arief Ramadhan on 24/06/22.
//

import UIKit

extension MenuPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMenuNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuPageCollectionViewCell
        cell.photoMenu.image = UIImage(named: menuImages[indexPath.row])
        cell.nameMenu.text = filteredMenuNames[indexPath.row]
        cell.totalFat.text = String(viewTotalFat[indexPath.row])
        cell.totalCarbo.text = String(viewTotalCarbo[indexPath.row])
        cell.totalCalory.text = String(viewTotalCalory[indexPath.row])
        cell.totalProtein.text = String(viewTotalProtein[indexPath.row])
        cell.shadowDecorate()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Nutrition", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NutritionViewController") as! NutritionViewController
        collectionView.deselectItem(at: indexPath, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
