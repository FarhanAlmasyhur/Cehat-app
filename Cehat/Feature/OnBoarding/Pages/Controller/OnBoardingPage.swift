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
    
    func setupLayout(){
        cehatIcon.frame = CGRect(x: 100, y: 150, width: 200, height: 200)
        
        cehatText.frame = CGRect(x: 130, y: 280, width: 140, height: 140)
        
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
        nextButton.alpha = 1.0
        
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
        
    }
    
    func toggleButton() {
        DispatchQueue.main.async {
            if self.yearOfBirthCompare != self.todayDateCompare {
                
                self.nextButton.isEnabled = true
                self.nextButton.tintColor =  UIColor(hex: 0xE88429)
                return
            }

            else {
                self.nextButton.isUserInteractionEnabled = false
                self.nextButton.tintColor =  UIColor(hex: 0xE1E1E1)
                self.nextButton.alpha = 1.0
                return
            }
        }
        
    }
    

}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
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
