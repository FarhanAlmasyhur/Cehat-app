//
//  ViewController.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 10/06/22.
//

import UIKit

class NutritionViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //  Data
    var arrOfNutrition : [NutritionStructure] = []
    var nutritionSeeder = NutritionSeeder()
    var dictOfArr: [NutritionType: [NutritionStructure]] = [:]
    var nutritionType: [NutritionType] = [.macro, .micro]
    
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
        v.text = "Kebutuhan anak Anda belum terpenuhi, ayo berikan makanan untuk memenuhinya"
        v.isScrollEnabled = false
        v.isSelectable = false

        return v
    }()
    
    lazy var barProgressPercentage: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFont(ofSize: 24)
        v.textColor = UIColor(hex: 0xE88429)
        v.frame = CGRect(x: 267, y: 172, width: 55, height: 35)
        v.text = "14%"

        return v
    }()
    
    lazy var detailKalori: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFont(ofSize: 16)
        v.textColor = UIColor(hex: 0x000000)
        v.frame = CGRect(x: 246.5, y: 235, width: 97, height: 19)
        v.text = "75/550 Kkal"

        return v
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
//        let myRect = UIView(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
//        myRect.roundCorners(corners: [.topRight, .topLeft])
//        myrect = UIColor.blue
//        
//        dailyPercentCalori.text = String(percentCalori) + "%"
//        let hitung : Float?
//        hitung = Float(percentCalori)/100
//
//        let circlePath1 = UIBezierPath(arcCenter: CGPoint(x: 310, y:205), radius: 45, startAngle: .pi/2, endAngle: .pi*2.5 , clockwise: true)
//        let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: 310, y:205), radius: 45, startAngle: -.pi/2, endAngle: ((.pi*2*CGFloat(hitung!)) - (.pi/2)) , clockwise: true)
//
//        let shape1 = CAShapeLayer()
//        let shape2 = CAShapeLayer()
//
//        shape1.path = circlePath1.cgPath
//        shape2.path = circlePath2.cgPath
//
//        shape1.lineWidth = 15
//        shape2.lineWidth = 15
//
//        shape1.strokeColor = UIColor.myGrayBar?.cgColor
//
//        if percentCalori <= 25 {
//            shape2.strokeColor = UIColor.myRedBar?.cgColor
//            DescriptInBar.text = "Kebutuhan anak Anda belum terpenuhi, ayo berikan makanan untuk memenuhinya"
//        }
//
//        else if (percentCalori > 25) && (percentCalori <= 50) {
//            shape2.strokeColor = UIColor.myOrangeBar?.cgColor
//            DescriptInBar.text = "Kebutuhan anak Anda masih kurang, ayo berikan makanan untuk memenuhinya"
//        }
//
//        else if (percentCalori > 50) && (percentCalori <= 75) {
//            shape2.strokeColor = UIColor.myGreenBar?.cgColor
//            DescriptInBar.text = "Terus lanjutkan memberikan nutrisi untuk memenuhi kebutuhan anak Anda"
//        }
//
//        else {
//            shape2.strokeColor = UIColor.myDarkGreen?.cgColor
//            if (percentCalori >= 100) {
//                DescriptInBar.text = "Selamat ! Anda telah berhasil memenuhi kebutuhan nutrisis harian anak"
//            }
//            else {
//                DescriptInBar.text = "Ayo sedikit lagi, kebutuhan harian anak Anda akan terpenuhi"
//            }
//        }
//
//        shape1.fillColor = UIColor.clear.cgColor
//        shape2.fillColor = UIColor.clear.cgColor
//
//        view.layer.addSublayer(shape1)
//        view.layer.addSublayer(shape2)

    }
    
    
}

extension UIView {
    enum Corner:Int {
        case bottomRight = 0,
        topRight,
        bottomLeft,
        topLeft
    }
    
    private func parseCorner(corner: Corner) -> CACornerMask.Element {
        let corners: [CACornerMask.Element] = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        return corners[corner.rawValue]
    }
    
    private func createMask(corners: [Corner]) -> UInt {
        return corners.reduce(0, { (a, b) -> UInt in
            return a + parseCorner(corner: b).rawValue
        })
    }
    
    func roundCorners(corners: [Corner], amount: CGFloat = 5) {
        layer.cornerRadius = amount
        let maskedCorners: CACornerMask = CACornerMask(rawValue: createMask(corners: corners))
        layer.maskedCorners = maskedCorners
    }
}



