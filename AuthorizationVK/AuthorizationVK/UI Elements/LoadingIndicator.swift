//
//  LoadingIndicator.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 21/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

@IBDesignable
class LoadingIndicator: UIControl {
    
    var oneCircleIndicatorView : UIView!
    var secondCircleIndicatorView: UIView!
    var thirdCircleIndicatorView: UIView!
    
    var screen = UIScreen()
    
    @IBInspectable var colorIndificator: UIColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    @IBInspectable var diameterBall: Int = 20
    @IBInspectable var borderWidth: CGFloat = 1
    @IBInspectable var colorBorder: UIColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        oneCircleIndicatorView = UIView(frame: CGRect(x: 0, y: 0, width: diameterBall, height: diameterBall))
        oneCircleIndicatorView.backgroundColor = colorIndificator
        oneCircleIndicatorView.layer.cornerRadius = CGFloat(diameterBall / 2)
        oneCircleIndicatorView.layer.borderWidth = borderWidth
        oneCircleIndicatorView.layer.opacity = 0
        oneCircleIndicatorView.layer.borderColor = colorBorder.cgColor
        
        secondCircleIndicatorView = UIView(frame: CGRect(x: diameterBall, y: 0, width: diameterBall, height: diameterBall))
        secondCircleIndicatorView.backgroundColor = colorIndificator
        secondCircleIndicatorView.layer.cornerRadius = CGFloat(diameterBall / 2)
        secondCircleIndicatorView.layer.borderWidth = borderWidth
        secondCircleIndicatorView.layer.opacity = 0
        secondCircleIndicatorView.layer.borderColor = colorBorder.cgColor
        
        thirdCircleIndicatorView = UIView(frame: CGRect(x: diameterBall * 2, y: 0, width: diameterBall, height: diameterBall))
        thirdCircleIndicatorView.backgroundColor = colorIndificator
        thirdCircleIndicatorView.layer.cornerRadius = CGFloat(diameterBall / 2)
        thirdCircleIndicatorView.layer.borderWidth = borderWidth
        thirdCircleIndicatorView.layer.opacity = 0
        thirdCircleIndicatorView.layer.borderColor = colorBorder.cgColor
        
        self.addSubview(oneCircleIndicatorView)
        self.addSubview(secondCircleIndicatorView)
        self.addSubview(thirdCircleIndicatorView)
        
        let duration = 1.55
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [.calculationModeCubic, .repeat], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5/3.0, animations: {
                self.oneCircleIndicatorView.layer.opacity = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5/duration, relativeDuration: 0.5/duration, animations: {
                self.oneCircleIndicatorView.layer.opacity = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5/duration, relativeDuration: 0.5/duration, animations: {
                self.oneCircleIndicatorView.layer.bounds = CGRect(x: 0, y: 0, width: 5, height: 5)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5/duration, relativeDuration: 0.5/duration, animations: {
                self.secondCircleIndicatorView.layer.opacity = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 1/duration, relativeDuration: 0.5/duration, animations: {
                self.secondCircleIndicatorView.layer.opacity = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 1/duration, relativeDuration: 0.5/duration, animations: {
                self.secondCircleIndicatorView.layer.bounds = CGRect(x: 0, y: 0, width: 5, height: 5)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/duration, relativeDuration: 0.5/duration, animations: {
                self.thirdCircleIndicatorView.layer.opacity = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 1.5/duration, relativeDuration: 0.5/duration, animations: {
                self.thirdCircleIndicatorView.layer.opacity = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 1.5/duration, relativeDuration: 0.5/duration, animations: {
                self.thirdCircleIndicatorView.layer.bounds = CGRect(x: 0, y: 0, width: 5, height: 5)
            })
        }, completion: nil)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0)
        self.bounds = CGRect(x: 0, y: 0, width: diameterBall * 3, height: diameterBall)
        
    }
    
    
}
