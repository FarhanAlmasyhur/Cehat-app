//
//  NutritionViewController + TableView.swift
//  Cehat
//
//  Created by William Yulio on 20/06/22.
//

import UIKit

extension NutritionViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    //    Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 60
        return cellSpacingHeight
    }
    
    //    Set up total section we want to show based on enum case
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = nutritionType[section]
        return dictOfArr[sections]?.count ?? 0
    }
    
    //    part of setting up how much section we want to show from numberOfRowsInSection func above
    func numberOfSections(in tableView: UITableView) -> Int {
        return nutritionType.count
    }
    
    //    Set Up what content do you want to show per cell in the table view and call the cell.xib file in the folder
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NutritionTableViewCell", for: indexPath) as! NutritionTableViewCell
        
        cell.contentsView.layer.masksToBounds = true
        
        let sections = nutritionType[indexPath.section]
        
        cell.nutritionLabel.text = dictOfArr[sections]?[indexPath.row].labelNutrition
        cell.nutritionLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        cell.nutritionIconImage.image = UIImage(named: dictOfArr[sections]?[indexPath.row].nutritionImage ?? "icon-karbo")
        cell.nutritionDescription.text = dictOfArr[sections]?[indexPath.row].detailNutrition
        
        cell.barProgressPercentage.text = dictOfArr[sections]?[indexPath.row].percentage
        cell.barProgressPercentage.font = UIFont.boldSystemFont(ofSize: 18)
        /*
        let persentase = 70
        
        if persentase <= 25 {
            cell.nutrientBarProgress.progressTintColor = UIColor(hex: 0xE05C23)
        }
        
        else if (persentase > 25) && (persentase <= 50) {
            cell.nutrientBarProgress.progressTintColor = UIColor(hex: 0xE88429)
        }
        
        else if (persentase > 50) && (persentase <= 75) {
            cell.nutrientBarProgress.progressTintColor = UIColor(hex: 0x91AB4D)
        }
        //
        else {
            cell.nutrientBarProgress.progressTintColor = UIColor(hex: 0x507B3E)
        }
        */
        //if( dictOfArr[sections]?[indexPath.row].labelNutrition == "Karbohidrat"){
        //    cell.nutrientBarProgress.progressTintColor = UIColor(hex: 0xFFFFFF)
        //}
        
        cell.setupCell(nutrition: dictOfArr[sections]?[indexPath.row])
        //cell.nutrientBarProgress.trackTintColor = UIColor(hex: 0xF4F4F5)
        //cell.nutrientBarProgress.progressTintColor = UIColor(hex: 0xE88429)
        //cell.nutrientBarProgress.transform = CGAffineTransform(scaleX: 4, y: 4)
        //cell.nutrientBarProgress.setProgress(1.0, animated: true)
        
        return cell
    }
     
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var header = nutritionType[section].rawValue
//
//        return header
//    }
    

    //    Customize the height for each cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight:CGFloat = CGFloat()
        cellHeight = 104
        return cellHeight
    }
    
    //    Section Control, to customize the font color, style and frame size
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()

        let label = UILabel()
        label.text = nutritionType[section].rawValue
        label.textColor = UIColor(hex: 0x507B3E)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 20, y: 20, width: 160, height: 30)
        view.addSubview(label)
        return view
    }
    
    //    Smooth Scrolling when scroll the cell, because of UIBezierPath (used to create the path for the shadow)
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
}
