//
//  Extension.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 22/06/22.
//

import UIKit

extension UIView {
    func circleView(){
        layer.cornerRadius = layer.bounds.width / 2
        clipsToBounds = true
    }
}

