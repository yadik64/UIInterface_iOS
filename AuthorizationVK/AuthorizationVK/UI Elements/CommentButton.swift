//
//  CommentButton.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 17/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

@IBDesignable
class CommentButton: UIButton {
    
    let color = UIColor(red: 0.359, green: 0.533, blue: 0.693, alpha: 1.000)
    let color2 = UIColor(red: 0.355, green: 0.529, blue: 0.686, alpha: 1.000)
    
    
    override func draw(_ rect: CGRect) {
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 17.89, y: 1))
        bezierPath.addLine(to: CGPoint(x: 7.11, y: 1))
        bezierPath.addCurve(to: CGPoint(x: 3.53, y: 1.3), controlPoint1: CGPoint(x: 5.35, y: 1), controlPoint2: CGPoint(x: 4.47, y: 1))
        bezierPath.addCurve(to: CGPoint(x: 1.3, y: 3.53), controlPoint1: CGPoint(x: 2.49, y: 1.68), controlPoint2: CGPoint(x: 1.68, y: 2.49))
        bezierPath.addLine(to: CGPoint(x: 1.26, y: 3.68))
        bezierPath.addCurve(to: CGPoint(x: 1, y: 7.11), controlPoint1: CGPoint(x: 1, y: 4.47), controlPoint2: CGPoint(x: 1, y: 5.35))
        bezierPath.addLine(to: CGPoint(x: 1, y: 12.89))
        bezierPath.addCurve(to: CGPoint(x: 1.3, y: 16.47), controlPoint1: CGPoint(x: 1, y: 14.65), controlPoint2: CGPoint(x: 1, y: 15.53))
        bezierPath.addCurve(to: CGPoint(x: 3.53, y: 18.7), controlPoint1: CGPoint(x: 1.68, y: 17.51), controlPoint2: CGPoint(x: 2.49, y: 18.32))
        bezierPath.addLine(to: CGPoint(x: 3.68, y: 18.74))
        bezierPath.addCurve(to: CGPoint(x: 7.11, y: 19), controlPoint1: CGPoint(x: 4.47, y: 19), controlPoint2: CGPoint(x: 5.35, y: 19))
        bezierPath.addLine(to: CGPoint(x: 17.89, y: 19))
        bezierPath.addCurve(to: CGPoint(x: 21.47, y: 18.7), controlPoint1: CGPoint(x: 19.65, y: 19), controlPoint2: CGPoint(x: 20.53, y: 19))
        bezierPath.addCurve(to: CGPoint(x: 23.7, y: 16.47), controlPoint1: CGPoint(x: 22.51, y: 18.32), controlPoint2: CGPoint(x: 23.32, y: 17.51))
        bezierPath.addLine(to: CGPoint(x: 23.74, y: 16.32))
        bezierPath.addCurve(to: CGPoint(x: 24, y: 12.89), controlPoint1: CGPoint(x: 24, y: 15.53), controlPoint2: CGPoint(x: 24, y: 14.65))
        bezierPath.addLine(to: CGPoint(x: 24, y: 7.11))
        bezierPath.addCurve(to: CGPoint(x: 23.7, y: 3.53), controlPoint1: CGPoint(x: 24, y: 5.35), controlPoint2: CGPoint(x: 24, y: 4.47))
        bezierPath.addCurve(to: CGPoint(x: 21.47, y: 1.3), controlPoint1: CGPoint(x: 23.32, y: 2.49), controlPoint2: CGPoint(x: 22.51, y: 1.68))
        bezierPath.addLine(to: CGPoint(x: 21.32, y: 1.26))
        bezierPath.addCurve(to: CGPoint(x: 17.89, y: 1), controlPoint1: CGPoint(x: 20.53, y: 1), controlPoint2: CGPoint(x: 19.65, y: 1))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 21.65, y: 0.33))
        bezierPath.addLine(to: CGPoint(x: 21.84, y: 0.37))
        bezierPath.addCurve(to: CGPoint(x: 24.63, y: 3.16), controlPoint1: CGPoint(x: 23.14, y: 0.85), controlPoint2: CGPoint(x: 24.15, y: 1.86))
        bezierPath.addCurve(to: CGPoint(x: 25, y: 7.64), controlPoint1: CGPoint(x: 25, y: 4.34), controlPoint2: CGPoint(x: 25, y: 5.44))
        bezierPath.addLine(to: CGPoint(x: 25, y: 12.36))
        bezierPath.addCurve(to: CGPoint(x: 24.67, y: 16.65), controlPoint1: CGPoint(x: 25, y: 14.56), controlPoint2: CGPoint(x: 25, y: 15.66))
        bezierPath.addLine(to: CGPoint(x: 24.63, y: 16.84))
        bezierPath.addCurve(to: CGPoint(x: 21.84, y: 19.63), controlPoint1: CGPoint(x: 24.15, y: 18.14), controlPoint2: CGPoint(x: 23.14, y: 19.15))
        bezierPath.addCurve(to: CGPoint(x: 17.36, y: 20), controlPoint1: CGPoint(x: 20.66, y: 20), controlPoint2: CGPoint(x: 19.56, y: 20))
        bezierPath.addLine(to: CGPoint(x: 7.64, y: 20))
        bezierPath.addCurve(to: CGPoint(x: 3.35, y: 19.67), controlPoint1: CGPoint(x: 5.44, y: 20), controlPoint2: CGPoint(x: 4.34, y: 20))
        bezierPath.addLine(to: CGPoint(x: 3.16, y: 19.63))
        bezierPath.addCurve(to: CGPoint(x: 0.37, y: 16.84), controlPoint1: CGPoint(x: 1.86, y: 19.15), controlPoint2: CGPoint(x: 0.85, y: 18.14))
        bezierPath.addCurve(to: CGPoint(x: 0, y: 12.36), controlPoint1: CGPoint(x: 0, y: 15.66), controlPoint2: CGPoint(x: 0, y: 14.56))
        bezierPath.addLine(to: CGPoint(x: 0, y: 7.64))
        bezierPath.addCurve(to: CGPoint(x: 0.33, y: 3.35), controlPoint1: CGPoint(x: 0, y: 5.44), controlPoint2: CGPoint(x: -0, y: 4.34))
        bezierPath.addLine(to: CGPoint(x: 0.37, y: 3.16))
        bezierPath.addCurve(to: CGPoint(x: 3.16, y: 0.37), controlPoint1: CGPoint(x: 0.85, y: 1.86), controlPoint2: CGPoint(x: 1.86, y: 0.85))
        bezierPath.addCurve(to: CGPoint(x: 7.57, y: 0), controlPoint1: CGPoint(x: 4.33, y: 0), controlPoint2: CGPoint(x: 5.42, y: 0))
        bezierPath.addLine(to: CGPoint(x: 7.64, y: 0))
        bezierPath.addLine(to: CGPoint(x: 17.36, y: 0))
        bezierPath.addCurve(to: CGPoint(x: 21.65, y: 0.33), controlPoint1: CGPoint(x: 19.56, y: 0), controlPoint2: CGPoint(x: 20.66, y: -0))
        bezierPath.close()
        color2.setFill()
        bezierPath.fill()
        
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 7, y: 20))
        bezier2Path.addLine(to: CGPoint(x: 7, y: 25))
        bezier2Path.addLine(to: CGPoint(x: 13, y: 20))
        bezier2Path.addLine(to: CGPoint(x: 7, y: 20))
        color.setFill()
        bezier2Path.fill()
        
    }
    
}
