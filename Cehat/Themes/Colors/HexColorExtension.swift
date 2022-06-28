//
//  HexColorExtension.swift
//  Cehat
//
//  Created by William Yulio on 20/06/22.
//

import Foundation
import UIKit

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

extension UIColor {
    static let myDarkGreen = UIColor(named: "DarkGreen")
    static let myGrayBar = UIColor(named: "GrayBar")
    static let myRedBar = UIColor(named: "RedBar")
    static let myOrangeBar = UIColor(named: "OrangeBar")
    static let myGreenBar = UIColor(named: "GreenBar")
}
