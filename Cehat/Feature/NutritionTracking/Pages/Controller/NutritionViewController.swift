//
//  ViewController.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 10/06/22.
//

import UIKit

class NutritionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//  Data
    var arrOfNutrition : [NutritionStructure] = []
//    var arrOfNutrition = [NutritionStructure]()
    var nutritionSeeder = NutritionSeeder()
    var dictOfArr: [NutritionType: [NutritionStructure]] = [:]
    var nutritionType: [NutritionType] = [.macro, .micro]
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NutritionTableViewCell.nib(), forCellReuseIdentifier: "NutritionTableViewCell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrOfNutrition = nutritionSeeder.arrOfNutritionSeeder
//        arrOfNutrition = nutritionSeeder.seedNutrition()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        dictOfArr = Dictionary(grouping: arrOfNutrition, by: {$0.categoryNutrition})
        print(dictOfArr.keys)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = nutritionType[section]
        return dictOfArr[sections]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nutritionType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NutritionTableViewCell", for: indexPath) as! NutritionTableViewCell
        let sections = nutritionType[indexPath.section]
        
        cell.nutritionLabel.text = dictOfArr[sections]?[indexPath.row].labelNutrition
        
        
        
//        if indexPath.section == 0{
//            cell.nutritionIconImage.image = UIImage(named: dataMacro.nutritionImage)
//            cell.nutritionLabel.text = data.labelNutrition
//            cell.nutritionDescription.text = data.detailNutrition
//            cell.barProgressPercentage.text = data.percentage
//        }
        
//        if data.categoryNutrition == .macro{
//            cell.nutritionIconImage.image = UIImage(named: data.nutritionImage)
//            cell.nutritionLabel.text = data.labelNutrition
//            cell.nutritionDescription.text = data.detailNutrition
//            cell.barProgressPercentage.text = data.percentage
//        }else{
//            cell.nutritionIconImage.image = UIImage(named: data.nutritionImage)
//            cell.nutritionLabel.text = data.labelNutrition
//            cell.nutritionDescription.text = data.detailNutrition
//            cell.barProgressPercentage.text = data.percentage
//        }
        
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nutritionType[section].rawValue
    }
    
    //Mengatur tinggi per cell, somehow kalau programmaticaly bisa diaturnya lewat func ini :')
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight:CGFloat = CGFloat()
        cellHeight = 74
        return cellHeight
    }

}

