//
//  ViewController.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 10/06/22.
//

import UIKit

class NutritionViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // CoreData Helper
    let menuManager: MenuHistoryRepository = CoreDataHistoryManager()
    
    //  Data
    var arrOfNutrition : [NutritionStructure] = []
    var nutritionSeeder = NutritionSeeder()
    var dictOfArr: [NutritionType: [NutritionStructure]] = [:]
    var nutritionType: [NutritionType] = [.macro, .micro]
    var dailyDictMenu: [String: [Menu]] = [:]
    var dailyMenus: [Menu] = []
    
    //Data Menu Makanan
    var caloriDailyMaks = 0.0
    var percentCalori: Double = 0.0
    var indexSelect : Int?
    var klri = 0.0
    var carbohydrate = 0.0
    var protein = 0.0
    var fat = 0.0
    var vitaminA = 0.0
    var vitaminB = 0.0
    var vitaminC = 0.0
    var vitaminD = 0.0
    var vitaminE = 0.0
    var zinc = 0.0
    var iron = 0.0
    var nutritionArray: [NutritionType:[Double]] = [:]

    
    lazy var bgRect: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: 0x507B3E)
        v.frame = CGRect(x: 0, y: 0, width: 390.0, height: 296.0)
        v.sizeToFit()
        v.roundCorners(corners: [.topRight, .topLeft, .bottomLeft, .bottomRight], amount: 40)
        
        return v
    }()
    
    lazy var headerText: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFont(ofSize: 36)
        v.textColor = UIColor(hex: 0xFFFFFF)
        v.frame = CGRect(x: 21, y: 50, width: 206, height: 48)
        v.text = "Tracking"

        return v
    }()
    
    lazy var bgWhiteRect: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: 0xFFFFFF)
        v.frame = CGRect(x: 20, y: 110, width: 350.0, height: 156.0)
        v.sizeToFit()
        v.roundCorners(corners: [.topRight, .topLeft, .bottomLeft, .bottomRight], amount: 33)
        
        return v
    }()
    
    lazy var subHeaderText: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFont(ofSize: 25)
        v.textColor = UIColor(hex: 0x507B3E)
        v.frame = CGRect(x: 42, y: 132, width: 212, height: 37)
        v.text = "Kebutuhan Kalori"

        return v
    }()
    
    lazy var subHeaderContent: UITextView = {
        let v = UITextView()
        v.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        v.textColor = UIColor(hex: 0x000000)
        v.frame = CGRect(x: 42, y: 165, width: 178, height: 93)
        
        if percentCalori <= 25 {
            v.text = "Kebutuhan anak Anda belum terpenuhi, ayo berikan makanan untuk memenuhinya"
        }
        //
        else if (percentCalori > 25) && (percentCalori <= 50) {
            v.text = "Kebutuhan anak Anda masih kurang, ayo berikan makanan untuk memenuhinya"
        }
        
        else if (percentCalori > 50) && (percentCalori <= 75) {
            v.text = "Terus lanjutkan memberikan nutrisi untuk memenuhi kebutuhan anak Anda"
        }
      
        else {
     
            v.text = "Selamat ! Anda telah berhasil memenuhi kebutuhan nutrisis harian anak"
        }

        v.isScrollEnabled = false
        v.isSelectable = false

        return v
    }()
    
    lazy var barProgressPercentage: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFont(ofSize: 18)
        v.textColor = UIColor(hex: 0xE88429)
        v.frame = CGRect(x: 275, y: 172, width: 55, height: 35)
        v.text = String(Int (100*klri/caloriDailyMaks))+"%"
        
        if percentCalori <= 25 {
            v.textColor = UIColor.myRedBar
        } else if (percentCalori > 25) && (percentCalori <= 50) {
            v.textColor = UIColor.myOrangeBar
        } else if (percentCalori > 50) && (percentCalori <= 75) {
            v.textColor = UIColor.myGreenBar
        } else {
            v.textColor = UIColor.myDarkGreen
        }
        
        

        return v
    }()
    
    lazy var detailKalori: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFont(ofSize: 15)
        v.textColor = UIColor(hex: 0x000000)
        v.frame = CGRect(x: 246.5, y: 240, width: 97, height: 19)
        
        v.text = String(Int(klri)) + "/" + String(Int(caloriDailyMaks)) + " kkal"
        return v
    }()
    
    lazy var barRectangle: UIView = {
        let v = UIView()
    
        let circlePath1 = UIBezierPath(arcCenter: CGPoint(x: 291, y:187), radius: 41, startAngle: .pi*3/2, endAngle: .pi*7/2 , clockwise: true)
        let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: 291, y:187), radius: 41, startAngle: .pi*3/2, endAngle: -(.pi*2*CGFloat(klri/caloriDailyMaks))+(.pi*3/2) , clockwise: false)
    
        let shape1 = CAShapeLayer()
        let shape2 = CAShapeLayer()

        shape1.path = circlePath1.cgPath
        shape2.path = circlePath2.cgPath
        
        shape1.lineWidth = 14
        shape2.lineWidth = 14
        
        shape1.strokeColor = UIColor.myGrayBar?.cgColor
        shape2.strokeColor = UIColor.blue.cgColor
        shape2.lineCap = .round
        
        percentCalori = (klri/caloriDailyMaks) * 100
        
        if percentCalori <= 25 {
            shape2.strokeColor = UIColor.myRedBar?.cgColor
        }
        
        else if (percentCalori > 25) && (percentCalori <= 50) {
            shape2.strokeColor = UIColor.myOrangeBar?.cgColor
        }
        
        else if (percentCalori > 50) && (percentCalori <= 75) {
            shape2.strokeColor = UIColor.myGreenBar?.cgColor
        }
        //
        else {
            shape2.strokeColor = UIColor.myDarkGreen?.cgColor
        }

        shape1.fillColor = UIColor.clear.cgColor
        shape2.fillColor = UIColor.clear.cgColor
        
        v.layer.addSublayer(shape1)
        v.layer.addSublayer(shape2)

        return v
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        agechild()
        setupData()
        setupView()
        
    }
    
    func setupData(){
        dailyDictMenu = menuManager.getHistoryMenu() ?? [:]
        dailyMenus = dailyDictMenu[Date.getTodaysDate()] ?? []
        
        for menu in dailyMenus {
            
            klri += menu.nutrients[.calories]
            print(klri)
//            menu.nutrients[.carbohydrate]
        }
        calculateNutrition(menus: dailyMenus)
    }
    
    func setupView(){
        tableView.register(NutritionTableViewCell.nib(), forCellReuseIdentifier: "NutritionTableViewCell")
        arrOfNutrition = nutritionSeeder.arrOfNutritionSeeder
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        dictOfArr = Dictionary(grouping: arrOfNutrition, by: {$0.categoryNutrition})
        
        view.addSubview(bgRect)
        view.addSubview(bgWhiteRect)
        view.addSubview(headerText)
        view.addSubview(subHeaderText)
        view.addSubview(subHeaderContent)
        view.addSubview(barProgressPercentage)
        view.addSubview(detailKalori)
        view.addSubview(barRectangle)
        view.backgroundColor = UIColor(hex: 0xf8f4f4)
    }
    
    func agechild() {
        let age = 2
        if (age >= 1) && (age <= 3) {
            caloriDailyMaks = 1350
        }
        else {
            caloriDailyMaks = 1400
        }
    }
    
    func calculateNutrition(menus: [Menu]){
        nutritionArray.removeAll()
        nutritionArray.updateValue([], forKey: .macro)
        nutritionArray.updateValue([], forKey: .micro)
        for menu in menus {
            carbohydrate += menu.nutrients[.carbohydrate]
            protein += menu.nutrients[.protein]
            fat += menu.nutrients[.fat]
            vitaminA += menu.nutrients[.vitaminA]
            vitaminB += menu.nutrients[.vitaminB]
            vitaminC += menu.nutrients[.vitaminC]
            vitaminD += menu.nutrients[.vitaminD]
            vitaminE += menu.nutrients[.vitaminE]
            zinc += menu.nutrients[.zinc]
            iron += menu.nutrients[.iron]
        }
        
        nutritionArray[.macro]?.append(carbohydrate)
        nutritionArray[.macro]?.append(protein)
        nutritionArray[.macro]?.append(fat)
        nutritionArray[.micro]?.append(vitaminA)
        nutritionArray[.micro]?.append(vitaminB)
        nutritionArray[.micro]?.append(vitaminC)
        nutritionArray[.micro]?.append(vitaminD)
        nutritionArray[.micro]?.append(vitaminE)
        nutritionArray[.micro]?.append(zinc)
        nutritionArray[.micro]?.append(iron)
        
    }
    
}







