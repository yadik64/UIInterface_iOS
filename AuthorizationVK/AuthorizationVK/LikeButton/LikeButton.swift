//
//  LikeButton.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 11/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit


@IBDesignable class LikeButton: UIButton {

    var bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    
    override func draw(_ rect: CGRect) {
        
        let bezierPath = UIBezierPath(heartIn: self.bounds)
        let color: UIColor = #colorLiteral(red: 0.1333333333, green: 0.5058823529, blue: 0.9647058824, alpha: 1)
        
        
        if bool {
            color.setStroke()
            bezierPath.stroke()
        } else {
            color.setFill()
            bezierPath.fill()
        }
        
    }
    
    
}

extension UIBezierPath {
    convenience init(heartIn rect: CGRect) {
        self.init()
        
        //Calculate Radius of Arcs using Pythagoras
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
        
        //Left Hand Curve
        self.addArc(withCenter: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        
        //Top Centre Dip
        self.addLine(to: CGPoint(x: rect.width/2, y: rect.height * 0.2))
        
        //Right Hand Curve
        self.addArc(withCenter: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)
        
        //Right Bottom Line
        self.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))
        
        //Left Bottom Line
        self.close()
    }
}

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}

