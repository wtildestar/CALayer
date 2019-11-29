//
//  SecondViewController.swift
//  CALayer
//
//  Created by wtildestar on 29/11/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

@IBDesignable class SecondViewController: UIViewController, CAAnimationDelegate {
//
//    func draw(_ rect: CGRect) {
//        let pathRect = CGRect(x: 100, y: 100, width: rect.width - 200, height: rect.height - 200)
//        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 24)
//        let color = UIColor.red
//        color.setStroke()
//        path.stroke()
//    }
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 5
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.7635269165, green: 0.06959813833, blue: 0, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 5
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 0
            let color = #colorLiteral(red: 0.7635269165, green: 0.06959813833, blue: 0, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }

    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1).cgColor
            gradientLayer.locations = [0.2, 0.8]
            gradientLayer.colors = [startColor, endColor]
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 10
            imageView.layer.borderColor = UIColor.red.cgColor
        }
    }
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 20)
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowRadius = 10
            button.layer.shadowOpacity = 0.8
        }
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        shapeLayer.path = path.cgPath
    }
    
    private func animationDidLoad() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        
        animation.delegate = self
        
//        overShapeLayer.add(animation, forKey: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
//        let animation = CABasicAnimation(keyPath: "someKey")
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
        
    }

}
