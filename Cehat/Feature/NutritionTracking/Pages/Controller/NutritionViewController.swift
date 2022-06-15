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
    var macroArr: [NutritionStructure] = []
    var microArr: [NutritionStructure] = []
    
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
        print(arrOfNutrition)
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        macroArr = arrOfNutrition.filter {$0.categoryNutrition == .macro}
        microArr = arrOfNutrition.filter {$0.categoryNutrition == .micro}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return macroArr.count
        } else {
            return microArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let data = arrOfNutrition[indexPath.row]
        let dataMacro = macroArr[indexPath.section]
//        let dataMicro = microArr[indexPath.section]
//        print(dataMacro)
        let cell = tableView.dequeueReusableCell(withIdentifier: "NutritionTableViewCell", for: indexPath) as! NutritionTableViewCell
        
        if indexPath.section == 0{
            cell.nutritionIconImage.image = UIImage(named: dataMacro.nutritionImage)
//            cell.nutritionLabel.text = data.labelNutrition
//            cell.nutritionDescription.text = data.detailNutrition
//            cell.barProgressPercentage.text = data.percentage
        }
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Makronutrien"
        }else {
            return "Mikronutrien"
        }
        
        
    }
    
    //Mengatur tinggi per cell, somehow kalau programmaticaly bisa diaturnya lewat func ini :')
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight:CGFloat = CGFloat()
        cellHeight = 74
        return cellHeight
    }

}

