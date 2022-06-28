//
//  OnBoardingPage.swift
//  Cehat
//
//  Created by Fiona Valencia on 17/06/22.
//

import UIKit

class OnBoardingPage: UIViewController {

    var yearOfBirthCompare : String?
    var todayDateCompare : String?
    var age : Int?
    var umurAnak : Int?
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var dateContentLayer: UIView!
    @IBOutlet weak var cehatIcon: UIImageView!
    @IBOutlet weak var cehatText: UIImageView!
    @IBOutlet weak var subHeaderText: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var calendarIcon: UIImageView!
    @IBOutlet weak var dateContentText: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupLayout()

    }
    
    override func viewDidAppear(_ animated: Bool) {
//        checkUserDefault()
    }
    
    
    func setupLayout(){
        cehatIcon.frame = CGRect(x: 95, y: 100, width: 200, height: 150)
        
        cehatText.frame = CGRect(x: 105, y: 220, width: 180, height: 120)
        
        subHeaderText.frame = CGRect(x: 120, y: 390, width: 164, height: 32)
        
        contentTextView.frame = CGRect(x: 44, y: 510, width: 303, height: 50)
        contentTextView.isScrollEnabled = false
        contentTextView.backgroundColor = .clear
        contentTextView.textColor = UIColor.white
        contentTextView.textAlignment = .center
        
        nextButton.frame = CGRect(x: 95, y: 606, width: 200, height: 47)
        nextButton.roundCorners(corners: [.topRight, .topLeft, .bottomLeft, .bottomRight], amount: 25)
        nextButton.tintColor =  UIColor(hex: 0xE1E1E1)
        nextButton.isUserInteractionEnabled = false
        
        
        skipButton.frame = CGRect(x: 157, y: 770, width: 75, height: 21)
        
        dateContentLayer.roundCorners(corners: [.topRight, .topLeft, .bottomLeft, .bottomRight], amount: 25)
        dateContentLayer.frame = CGRect(x: 38, y: 435, width: 313, height: 53)
        
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        let dateStyle = DateFormatter()
        dateStyle.timeZone = TimeZone(abbreviation: "GMT+7")
        dateStyle.locale = NSLocale.current
        dateStyle.dateFormat = "yyyy"
        
        let compareDate = DateFormatter()
        compareDate.dateFormat = "dd.MM.yy"
        
        let yearOfBirthString = dateStyle.string(from: dateOfBirth.date)
        
        let yearOfBirthInt = Int(yearOfBirthString) ?? 0
        
        yearOfBirthCompare = compareDate.string(from: dateOfBirth.date)
        
        let date = Date()
        let todayString = dateStyle.string(from: date)
        
        let todayDateInt = Int(todayString) ?? 0
        
        todayDateCompare = compareDate.string(from: date)
        age = todayDateInt - yearOfBirthInt

        toggleButton()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        UserDefaults.standard.set(age, forKey: "childAge")  //Integer
        self.performSegue(withIdentifier: "toNutritionPage", sender: self)
        
        
    }
    
    func toggleButton() {
        DispatchQueue.main.async {
            if self.yearOfBirthCompare != self.todayDateCompare {
                
                self.nextButton.isUserInteractionEnabled = true
                self.nextButton.tintColor =  UIColor(hex: 0xE88429)
                return
            }

            else {
                self.nextButton.isUserInteractionEnabled = false
                self.nextButton.tintColor =  UIColor(hex: 0xE1E1E1)
                
                return
            }
        }
        
    }
    
    func checkUserDefault() {
        let ageChild: Int? =  UserDefaults.standard.integer(forKey: "childAge")
        if ageChild != nil {
            self.performSegue(withIdentifier: "toNutritionPage", sender: self)
        }
    }
    

}
