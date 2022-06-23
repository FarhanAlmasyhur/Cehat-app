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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelFat.text = "Lemak"
        labelCarbo.text = "Karbohidrat"
        labelCalory.text = "kkal"
        labelProtein.text = "Protein"
    }

}
