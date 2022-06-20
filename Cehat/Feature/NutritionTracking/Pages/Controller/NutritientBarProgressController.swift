//
//  NutritientBarProgressController.swift
//  Cehat
//
//  Created by William Yulio on 17/06/22.
//

import Foundation
import UIKit

@IBDesignable
class NutrientProgressBar: UIView {
    @IBInspectable var color: UIColor = .gray {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var gradientColor: UIColor = .white {
        didSet { setNeedsDisplay() }
    }

    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }

    private let progressLayer = CALayer()
    private let gradientLayer = CAGradientLayer()
    private let backgroundMask = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
        createAnimation()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
        createAnimation()
    }

    private func setupLayers() {
        layer.addSublayer(gradientLayer)

        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0.35, 0.5, 0.65]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
    }

    private func createAnimation() {
        let flowAnimation = CABasicAnimation(keyPath: "locations")
        flowAnimation.fromValue = [-0.3, -0.15, 0]
        flowAnimation.toValue = [1, 1.15, 1.3]

        flowAnimation.isRemovedOnCompletion = false
        flowAnimation.repeatCount = Float.infinity
        flowAnimation.duration = 1

        gradientLayer.add(flowAnimation, forKey: "flowAnimation")
    }
    
    func setProgress(to percent : CGFloat)
    {
        progress = percent
        print(percent)
        let duration = 0.5
        
        let rect = self.bounds
        let oldBounds = progressLayer.bounds
        let newBounds = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
        
        
        let redrawAnimation = CABasicAnimation(keyPath: "bounds")
        redrawAnimation.fromValue = oldBounds
        redrawAnimation.toValue = newBounds

        redrawAnimation.fillMode = .both
        redrawAnimation.isRemovedOnCompletion = false
        redrawAnimation.duration = duration
        
        progressLayer.bounds = newBounds
        progressLayer.position = CGPoint(x: 0, y: 0)
        
        progressLayer.anchorPoint = CGPoint(x: 0, y: 0)
        
        progressLayer.add(redrawAnimation, forKey: "redrawAnim")
        
        let oldGradEnd = gradientLayer.endPoint
        let newGradEnd = CGPoint(x: progress, y: 0.5)
        let gradientEndAnimation = CABasicAnimation(keyPath: "endPoint")
        gradientEndAnimation.fromValue = oldGradEnd
        gradientEndAnimation.toValue = newGradEnd
        
        gradientEndAnimation.fillMode = .both
        gradientEndAnimation.isRemovedOnCompletion = false
        gradientEndAnimation.duration = duration
        
        gradientLayer.endPoint = newGradEnd
        
        gradientLayer.add(gradientEndAnimation, forKey: "gradEndAnim")
        
    }

    override func draw(_ rect: CGRect) {
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
        layer.mask = backgroundMask

        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))

        progressLayer.frame = progressRect
        progressLayer.backgroundColor = UIColor.black.cgColor

        gradientLayer.frame = rect
        gradientLayer.colors = [color.cgColor, gradientColor.cgColor, color.cgColor]
        gradientLayer.endPoint = CGPoint(x: progress, y: 0.5)
    }
}
