//
//  MokeView.swift
//  MokeForFun
//
//  Created by Gerry on 8/15/16.
//  Copyright © 2016 gaoyve. All rights reserved.
//

import UIKit
import QuartzCore

// delay function
func delay(seconds: Double, completion:@escaping ()->()) {
    let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
    
    DispatchQueue.main.asyncAfter(deadline: popTime) {
        completion()
    }
}

class MokeView: UIView {
    
    var ringLayer: CAShapeLayer = CAShapeLayer()
    var gradientLayer: CAGradientLayer = CAGradientLayer()
    
    var lineWidth: CGFloat = 25.0
    let strokeColor: UIColor = UIColor.blue
    let startColor: UIColor = UIColor.init(red: 0.1647, green: 0.4431, blue: 0.7765, alpha: 1.00)
    let midStartColor: UIColor = UIColor.init(red:0.43, green:0.62, blue:0.85, alpha: 0.50)
    let midEndColor: UIColor = UIColor.init(red:0.40, green:0.60, blue:0.84, alpha: 0.50)
    let endColor: UIColor = UIColor.white
//    let endColor: UIColor = UIColor.init(red: 0.6824, green: 0.7922, blue: 0.9373, alpha: 0.00)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadLayers()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loadLayers()
    }
    
    func loadLayers() {
        let ringRadius = min(bounds.size.width, bounds.size.height)/2 - lineWidth
        
        // ring layer
        let centerX = bounds.size.width/2
        let centerY = bounds.size.height/2
        print("\(bounds)")
//        let startAngle: CGFloat = CGFloat.pi / 10.0
//        let endAngle: CGFloat = CGFloat.pi * 2
//        let ringPath = UIBezierPath.init(arcCenter: CGPoint(x: centerX, y: centerY), radius: ringRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true).cgPath
//        
//        ringLayer.strokeColor = startColor.cgColor
//        ringLayer.fillColor = UIColor.clear.cgColor
//        ringLayer.lineWidth = lineWidth
//        ringLayer.path = ringPath
////        ringLayer.lineCap = kCALineCapRound
//        ringLayer.lineJoin = kCALineJoinRound
//        
//        // gradient layer
//        gradientLayer.frame = bounds
//        
//        
//        // Create gradient layers
//        let gradientDown = CAGradientLayer()
//        gradientDown.frame = CGRect.init(x: bounds.origin.x, y: bounds.origin.y + bounds.height/2, width: bounds.width, height: bounds.height/2)
//        gradientDown.colors = [midStartColor.cgColor, endColor.cgColor]
//        gradientDown.startPoint = CGPoint.init(x: 0.0, y: 0.5)
//        gradientDown.endPoint = CGPoint.init(x: 1.0, y: 0.5)
//        gradientLayer.addSublayer(gradientDown)
//        
//        let gradientUp = CAGradientLayer()
//        gradientUp.frame = CGRect.init(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height/2)
//        gradientUp.colors = [midEndColor.cgColor, startColor.cgColor]
//        gradientUp.startPoint = CGPoint.init(x: 0.0, y: 0.5)
//        gradientUp.endPoint = CGPoint.init(x: 1.0, y: 0.5)
//        gradientLayer.addSublayer(gradientUp)
//        
//        layer.addSublayer(gradientLayer)
//        
//        // mask
//        gradientLayer.mask = ringLayer
        
    }
    
    func startAnimate() {
        
        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 1.5
        strokeAnimation.repeatCount = 1.0
        ringLayer.add(strokeAnimation, forKey: nil)
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = 2 * CGFloat.pi
        animation.duration = 1.5
        animation.repeatCount = Float.infinity
        delay(seconds: 1.4, completion: {
            self.layer.add(animation, forKey: "rotate")
        })
        
    }
    
    func stopAnimate() {
        layer.removeAnimation(forKey: "rotate")
    }
}
