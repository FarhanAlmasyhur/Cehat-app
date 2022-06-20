//
//  ViewController.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 10/06/22.
//

import UIKit

class NutritionViewController: UIViewController {
    
    //  Data
    var arrOfNutrition : [NutritionStructure] = []
    var nutritionSeeder = NutritionSeeder()
    var dictOfArr: [NutritionType: [NutritionStructure]] = [:]
    var nutritionType: [NutritionType] = [.macro, .micro]
    
    //    Register Table View on NutritionViewController
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NutritionTableViewCell.nib(), forCellReuseIdentifier: "NutritionTableViewCell")
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        arrOfNutrition = nutritionSeeder.arrOfNutritionSeeder
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        dictOfArr = Dictionary(grouping: arrOfNutrition, by: {$0.categoryNutrition})
        

    }
    
    
    
}



