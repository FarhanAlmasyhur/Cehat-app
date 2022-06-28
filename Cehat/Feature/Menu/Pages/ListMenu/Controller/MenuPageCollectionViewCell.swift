//
//  MenuPageCollectionViewCell.swift
//  Cehat
//
//  Created by Arief Ramadhan on 15/06/22.
//

import UIKit

class MenuPageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameMenu: UILabel!
    @IBOutlet weak var photoMenu: UIImageView!
    @IBOutlet weak var totalCalory: UILabel!
    @IBOutlet weak var labelCalory: UILabel!
    @IBOutlet weak var totalCarbo: UILabel!
    @IBOutlet weak var labelCarbo: UILabel!
    @IBOutlet weak var totalProtein: UILabel!
    @IBOutlet weak var labelProtein: UILabel!
    @IBOutlet weak var totalFat: UILabel!
    @IBOutlet weak var labelFat: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
    
    func setupLayout(){
        labelFat.text = "lemak"
        labelFat.textColor = UIColor(hex: 0x507B3E)
        labelFat.font = UIFont.systemFont(ofSize: 10)
        labelFat.frame = CGRect(x: 318, y: 327, width: 29, height: 12)
        labelFat.textAlignment = .center
        
        labelCarbo.text = "karbohidrat"
        labelCarbo.textColor = UIColor(hex: 0x507B3E)
        labelCarbo.font = UIFont.systemFont(ofSize: 10)
        labelCarbo.frame = CGRect(x: 175, y: 327, width: 56, height: 12)
        labelCarbo.textAlignment = .center
        
        labelCalory.text = "kkal"
        labelCalory.textColor = UIColor(hex: 0xE05C23)
        labelCalory.font = UIFont.systemFont(ofSize: 10)
        labelCalory.frame = CGRect(x: 137, y: 327, width: 20, height: 12)
        labelCalory.textAlignment = .center
        
        labelProtein.text = "protein"
        labelProtein.textColor = UIColor(hex: 0x507B3E)
        labelProtein.font = UIFont.systemFont(ofSize: 10)
        labelProtein.frame = CGRect(x: 252, y: 327, width: 35, height: 12)
        labelProtein.textAlignment = .center
        
        addButton.tintColor =  UIColor(hex: 0xE88429)
    }

}
