//
//  DetailMenuController+UICollectionView.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 22/06/22.
//

import UIKit


extension DetailMenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NutrientsType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NutritionCountCell", for: indexPath) as! NutrientsCountCollectionViewCell
        
        
        let type = NutrientsType.allCases.first(where: { $0.rawValue == indexPath.row })!
        let value = menu?.nutrients[type] ?? 0
        
        cell.setupCell(with: NutrientsData(nutritionType: type, nutritionValue: value))
        cell.setupUnit(index: indexPath.row)
        return cell
    }
}


extension DetailMenuViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
