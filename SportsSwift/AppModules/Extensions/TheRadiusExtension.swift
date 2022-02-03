//
//  TheRadiusExtension.swift
//  SportsApp
//
//  Created by nada elmasry on 2/2/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var radius : CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}



 //MARK: Circulate Image
extension UIImageView {
   func makeRounded() {
       let radius = self.frame.width/2
       self.layer.cornerRadius = radius
       self.layer.masksToBounds = true
   }
    
    
    func makeCurved(){
        self.layer.cornerRadius = 17.0
        self.layer.masksToBounds = true
        self.layer.isOpaque = false
    }
}


//MARK: Circulate cells

extension UIView {
    func makeCorner(withRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.isOpaque = false
    }
}

//MARK: Change image opasity
extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

