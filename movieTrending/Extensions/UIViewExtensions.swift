//
//  UIViewExtensions.swift
//  movieTrending
//
//  Created by BS1095 on 9/4/23.
//

import Foundation
import UIKit

extension UIView {
    
    func round(_ radius: CGFloat = 10){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
