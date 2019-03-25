//
//  LikeView.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 21/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class LikeView: UIView {

    override func draw(_ rect: CGRect) {
        
        let bezierPath = UIBezierPath(heartIn: self.bounds)
        let color: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        bezierPath.lineWidth = 1.0
        
        color.setStroke()
        bezierPath.stroke()
        
    }
    
    
}
