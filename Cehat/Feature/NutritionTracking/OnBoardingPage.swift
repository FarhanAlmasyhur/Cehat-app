//
//  OnBoardingPage.swift
//  Cehat
//
//  Created by Fiona Valencia on 17/06/22.
//

import UIKit

class OnBoardingPage: UIViewController {

    var yearOfBirthInt : Int?
    @IBOutlet weak var dateofbirth: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func lanjutkanBtn(_ sender: Any) {
        
        let datestyle = DateFormatter()
        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "yyyy"
        let yearOfBirthString = datestyle.string(from: dateofbirth.date)
        yearOfBirthInt = Int(yearOfBirthString)
        umuranak()
    }
    
    func umuranak() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let todayString = dateFormatter.string(from: date)
        
        let todayInt = Int(todayString)
        let umur = todayInt! - yearOfBirthInt!
        print(umur)
        
    }
}
