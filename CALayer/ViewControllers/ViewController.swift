//
//  ViewController.swift
//  CALayer
//
//  Created by wtildestar on 29/11/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0) // gradientLayer at:0 нижний слой
    }


}

