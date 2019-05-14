//
//  ConfirmDriver.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit
import Foundation

class CustomProgressView: UIView {
    
    // MARK: - Properties
    var shapeLayer = CAShapeLayer()
    
    // MARK: -
    // MARK: - LC
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    
    // MARK: -
    // MARK: - Animation methods
    func animationProgress(with duration: Int) {
        self.shapeLayer.removeFromSuperlayer()
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: self.bounds.maxY / 2))
        path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.maxY / 2))
        
        // create shape layer for that path
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1).cgColor
        shapeLayer.lineWidth = self.bounds.maxY
        shapeLayer.path = path.cgPath
        
        // animate it
        self.layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = CFTimeInterval(duration)
        shapeLayer.add(animation, forKey: "MyAnimation")
        
        // save shape layer
        self.shapeLayer = shapeLayer
    }
}
