//
//  View.swift
//  MaskDemo
//
//  Created by wtildestar on 29/11/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

@IBDesignable
class View: UIView {
    
    private var size = CGSize()
    
    @IBInspectable var cornerRadiiSize: CGFloat = 0 {
        didSet {
            size = CGSize(width: cornerRadiiSize, height: cornerRadiiSize)
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 30, height: 30)).cgPath
        
        layer.mask = shapeLayer
        DispatchQueue.main.async {
            func prepareForInterfaceBuilder() {
                self.setNeedsLayout()
            }
        }
        
    }
    
}


