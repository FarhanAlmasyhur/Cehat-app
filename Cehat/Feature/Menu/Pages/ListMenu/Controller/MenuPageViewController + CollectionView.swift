//
//  MenuPageViewController + CollectionView.swift
//  Cehat
//
//  Created by Arief Ramadhan on 24/06/22.
//

import UIKit

extension MenuPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dictionaryHistory = historyManager.getHistoryMenu()
        let dateData: [String] = dictionaryHistory?.keys.map{$0}.sorted{$0.localizedStandardCompare($1) == .orderedDescending} ?? []
        let sections = dateData[section]
        
        if flag == false {
            return filteredMenuNames.count
        }else{
            return dictionaryHistory?[sections]?.count ?? 0

        }
//        return filteredMenuNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
      }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let dictionaryHistory = historyManager.getHistoryMenu()
        if flag == false {
            return 1
        }else{
            return dictionaryHistory?.keys.map{$0}.count ?? 1

        }

    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as? SectionHeader{
            let dictionaryHistory = historyManager.getHistoryMenu()
            let dateData: [String] = dictionaryHistory?.keys.map{$0} ?? []
            if flag == false{
                sectionHeader.sectionHeaderlabel.text = ""
            }else{
                sectionHeader.sectionHeaderlabel.text = dateData[indexPath.section]
                sectionHeader.sectionHeaderlabel.font = UIFont.boldSystemFont(ofSize: 20)
            }
            

            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuPageCollectionViewCell
        cell.photoMenu.image = UIImage(named: menuImages[indexPath.row])
        cell.nameMenu.text = filteredMenuNames[indexPath.row]
        cell.nameMenu.font = UIFont.boldSystemFont(ofSize: 18)
        cell.nameMenu.frame = CGRect(x: 139, y: 261, width: 111, height: 24)
        
        cell.totalFat.text = String(viewTotalFat[indexPath.row])
        cell.totalFat.textColor = UIColor(hex: 0x507B3E)
        cell.totalFat.font = UIFont.boldSystemFont(ofSize: 12)
        cell.totalFat.frame = CGRect(x: 304, y: 303, width: 56, height: 24)
        cell.totalFat.textAlignment = .center
        
        cell.totalCarbo.text = String(viewTotalCarbo[indexPath.row])
        cell.totalCarbo.textColor = UIColor(hex: 0x507B3E)
        cell.totalCarbo.font = UIFont.boldSystemFont(ofSize: 12)
        cell.totalCarbo.frame = CGRect(x: 175, y: 303, width: 56, height: 24)
        cell.totalCarbo.textAlignment = .center
        
        cell.totalCalory.text = String(viewTotalCalory[indexPath.row])
        cell.totalCalory.textColor = UIColor(hex: 0xE05C23)
        cell.totalCalory.font = UIFont.boldSystemFont(ofSize: 12)
        cell.totalCalory.frame = CGRect(x: 129, y: 303, width: 33, height: 24)
        cell.totalCalory.textAlignment = .center
        
        cell.totalProtein.text = String(viewTotalProtein[indexPath.row])
        cell.totalProtein.textColor = UIColor(hex: 0x507B3E)
        cell.totalProtein.font = UIFont.boldSystemFont(ofSize: 12)
        cell.totalProtein.frame = CGRect(x: 241, y: 303, width: 56, height: 24)
        cell.totalProtein.textAlignment = .center
        
        cell.shadowDecorate()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailMenu", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailMenuViewController") as! DetailMenuViewController
        collectionView.deselectItem(at: indexPath, animated: true)
        vc.menu = arrayMenu[indexPath.row]
        hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    

}
