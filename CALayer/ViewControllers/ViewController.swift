//
//  ViewController.swift
//  CALayer
//
//  Created by wtildestar on 29/11/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shapeLayer: CAShapeLayer! {
        // задаем параметры по умолчанию наблюдателю свойств
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.1307066083, green: 0.690694809, blue: 0.8784407973, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        // задаем параметры по умолчанию наблюдателю свойств
        didSet {
            overShapeLayer.lineWidth = 20
            overShapeLayer.lineCap = .round
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            overShapeLayer.strokeColor = color
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.2338167727, green: 0.1325625181, blue: 0.3181051314, alpha: 1)  .cgColor
            let endColor = #colorLiteral(red: 0.3772423267, green: 0.2137286961, blue: 0.5167021751, alpha: 1)  .cgColor
            gradientLayer.colors = [startColor, endColor]
//            gradientLayer.locations = [0, 0.2, 1]
        }
    }

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.masksToBounds = true
            let borderColor = UIColor.gray
            imageView.layer.borderColor = borderColor.cgColor
            imageView.layer.borderWidth = 10
            
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
        }
    }
    
    // Срабатывает каждый раз при изменении ориентации устройства
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0) // gradientLayer at:0 нижний слой

        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
    }

    @IBAction func tapped(_ sender: UIButton) {
        overShapeLayer.strokeEnd += 0.2
        if overShapeLayer.strokeEnd == 1 {
            performSegue(withIdentifier: "ShowSecondScreen", sender: self)
        }
    }
    
}

