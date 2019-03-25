//
//  Viewed.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 17/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

@IBDesignable
class Viewed: UIView {

    let color2 = UIColor(red: 0.500, green: 0.500, blue: 0.500, alpha: 0.499)
    let color3 = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1.000)

    override func draw(_ rect: CGRect) {
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 12.5, y: 10))
        bezierPath.addCurve(to: CGPoint(x: 11.76, y: 10.09), controlPoint1: CGPoint(x: 12.24, y: 10), controlPoint2: CGPoint(x: 12, y: 10.03))
        bezierPath.addCurve(to: CGPoint(x: 9.66, y: 12.5), controlPoint1: CGPoint(x: 10.55, y: 10.37), controlPoint2: CGPoint(x: 9.66, y: 11.34))
        bezierPath.addCurve(to: CGPoint(x: 12.5, y: 15), controlPoint1: CGPoint(x: 9.66, y: 13.88), controlPoint2: CGPoint(x: 10.93, y: 15))
        bezierPath.addCurve(to: CGPoint(x: 15.34, y: 12.5), controlPoint1: CGPoint(x: 14.07, y: 15), controlPoint2: CGPoint(x: 15.34, y: 13.88))
        bezierPath.addCurve(to: CGPoint(x: 12.5, y: 10), controlPoint1: CGPoint(x: 15.34, y: 11.12), controlPoint2: CGPoint(x: 14.07, y: 10))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 17.5, y: 9.31))
        bezierPath.addCurve(to: CGPoint(x: 25, y: 12.75), controlPoint1: CGPoint(x: 21.91, y: 9.89), controlPoint2: CGPoint(x: 25, y: 11.21))
        bezierPath.addCurve(to: CGPoint(x: 12.5, y: 16.5), controlPoint1: CGPoint(x: 25, y: 14.82), controlPoint2: CGPoint(x: 19.4, y: 16.5))
        bezierPath.addCurve(to: CGPoint(x: 0, y: 12.75), controlPoint1: CGPoint(x: 5.6, y: 16.5), controlPoint2: CGPoint(x: 0, y: 14.82))
        bezierPath.addCurve(to: CGPoint(x: 12.5, y: 9), controlPoint1: CGPoint(x: 0, y: 10.68), controlPoint2: CGPoint(x: 5.6, y: 9))
        bezierPath.addCurve(to: CGPoint(x: 17.5, y: 9.31), controlPoint1: CGPoint(x: 14.28, y: 9), controlPoint2: CGPoint(x: 15.97, y: 9.11))
        bezierPath.close()
        color2.setFill()
        bezierPath.fill()
        
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 11, y: 11, width: 3, height: 3))
        color3.setFill()
        ovalPath.fill()
    }

}
