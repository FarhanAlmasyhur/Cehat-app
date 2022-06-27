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
