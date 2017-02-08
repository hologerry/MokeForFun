//
//  MokeLoadingView.swift
//  MokeForFun
//
//  Created by Gerry on 8/17/16.
//  Copyright © 2016 gaoyve. All rights reserved.
//

import UIKit


func delay(seconds: Double, completion:@escaping ()->()) {
    let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
    
    DispatchQueue.main.asyncAfter(deadline: popTime) {
        completion()
    }
}

class MokeLoadingView: UIView {
    let mokeImageView = UIImageView(image: UIImage(named: "moke"))
    let ringRadius: CGFloat = 75.0 - 32.3/2
    
    let ringLayer = CAShapeLayer()
    let maskLayer = CAShapeLayer()
    let mokeLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateProperties()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateProperties()
    }
    
    func updateProperties() {
        mokeImageView.center = CGPoint(x: bounds.midX, y: bounds.midY)
//        ringMaskLayer.path = UIBezierPath.init(ovalIn: CGRect(x: bounds.origin.x + 32.3/2, y: bounds.origin.y + 32.3/2, width: 2 * ringRadius, height: 2 * ringRadius)).cgPath
        let startAngle = CGFloat.pi * 1.50
        let endAngle = CGFloat.pi * 1.50 - 0.001
        let ovalPath = UIBezierPath.init(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: ringRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true).cgPath
        ringLayer.path = ovalPath
        ringLayer.fillColor = UIColor.clear.cgColor
        ringLayer.strokeColor = UIColor.lightGray.cgColor
        ringLayer.lineWidth = 32.3
        
        
//        addSubview(mokeImageView)
//        ringMaskLayer.mask = mokeImageView.layer
//        layer.addSublayer(mokeImageView.layer)
        
//        maskLayer.path = ovalPath
//        maskLayer.fillColor = UIColor.clear.cgColor
//        maskLayer.strokeColor = UIColor.gray.cgColor
//        maskLayer.lineWidth = 32.3
        
//        layer.addSublayer(maskLayer)
//        maskLayer.mask = mokeImageView.layer
        
        
        mokeLayer.frame = mokeImageView.bounds
        mokeLayer.addSublayer(mokeImageView.layer)
        layer.addSublayer(mokeLayer)
        layer.addSublayer(ringLayer)
        
    }
    
    func startAnimateLayers() {
        let ringMaskStrokeAnimation = CABasicAnimation(keyPath: "strokeStart")
        ringMaskStrokeAnimation.fromValue = 0.0
        ringMaskStrokeAnimation.toValue = 1.0
        ringMaskStrokeAnimation.duration = 1.5
        ringMaskStrokeAnimation.repeatCount = 1.0
        ringLayer.add(ringMaskStrokeAnimation, forKey: nil)
        
        let mokeRingRotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        mokeRingRotationAnimation.toValue = CGFloat.pi * 2
        mokeRingRotationAnimation.duration = 1.5
        mokeRingRotationAnimation.repeatCount = Float.infinity
        mokeLayer.add(mokeRingRotationAnimation, forKey: nil)
        
        delay(seconds: 1.5) { 
            self.ringLayer.isHidden = true
        }
    }
    
    func stopAnimateLayers() {
        ringLayer.removeAllAnimations()
        mokeLayer.removeAllAnimations()
    }
}
