//
//  ViewController.swift
//  CALayer
//
//  Created by wtildestar on 29/11/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

