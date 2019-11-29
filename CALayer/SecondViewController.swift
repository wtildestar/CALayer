//
//  SecondViewController.swift
//  CALayer
//
//  Created by wtildestar on 29/11/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
