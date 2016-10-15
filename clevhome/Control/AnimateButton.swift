//
//  AnimateButton.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import UIKit

class AnimateButton: UIButton {
    var radius:CGFloat? = 60
    var clockwise:Bool?
    var lineColor: UIColor?
    var animatedLayer: CAShapeLayer!
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let layer = CAShapeLayer()
        animatedLayer = layer
        animatedLayer?.contentsCenter = self.layer.contentsCenter
        layer.strokeColor = lineColor?.cgColor ?? UIColor.purple.cgColor
        layer.fillColor = UIColor.clear.cgColor
    }
    
    private func addBezierPath(layer:CAShapeLayer){
        let path = UIBezierPath(arcCenter: CGPoint(x: 0,y: 0), radius: radius ?? 30, startAngle: 0, endAngle: CGFloat(7/4 * M_PI), clockwise: clockwise ?? true)
        layer.path = path.cgPath
    }
    
    
    private func pathAnimationRotation(layer:CAShapeLayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = 2 * M_PI
        animation.duration = 1
        animation.repeatCount = 10000
        layer.add(animation, forKey: nil)
    }
    
    private func pathAnimationStrokeStartAndEnd(layer:CALayer) {
        let animationStart = CABasicAnimation(keyPath: "strokeStart")
        animationStart.fromValue = 0.5
        animationStart.toValue = 0
        animationStart.duration = 1
        animationStart.autoreverses = true
        animationStart.repeatCount = Float.infinity
        layer.add(animationStart, forKey: "")
        
        let animationEnd = CABasicAnimation(keyPath: "strokeEnd")
        animationEnd.fromValue = 0.5
        animationEnd.toValue = 1
        animationEnd.duration = 1
        animationEnd.autoreverses = true
        animationEnd.repeatCount = Float.infinity
        layer.add(animationEnd, forKey: "")
    }
    
    private func pathanimationLineWidth(layer:CALayer) {
        let animation = CABasicAnimation(keyPath: "lineWidth")
        animation.fromValue = 2
        animation.toValue = 4
        animation.duration = 2
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: "")
    }
    
    internal func beginAnimation(){
        addBezierPath(layer: animatedLayer)
        pathAnimationRotation(layer: animatedLayer)
        pathAnimationStrokeStartAndEnd(layer: animatedLayer)
        pathanimationLineWidth(layer: animatedLayer)
        animatedLayer.position = CGPoint(x: layer.bounds.midX, y: layer.bounds.midY)//layer.bounds.width/2,layer.b.height/2
        animatedLayer.zPosition = layer.zPosition + 1
        
        print(animatedLayer.position)
        self.layer.addSublayer(animatedLayer)
    }
    
    internal func endAnimation(){
        self.animatedLayer?.removeFromSuperlayer()
//        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [], animations: { 
//            self.snp.updateConstraints({ (make) in
//                make.width.equalTo(self.snp.center)//*1.2)
//            })
//            }) { (bool) in
//                
//        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
