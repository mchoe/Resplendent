//
//  UIColor+Resplendent.swift
//  Resplendent
//
//  Created by Michael Choe on 1/5/16.
//  Copyright © 2016 Strauss LLC. All rights reserved.
//



import UIKit

extension UIColor {
    
    public convenience init(r: Int, g: Int, b: Int, a: CGFloat? = nil) {
        
        let alphaValue: CGFloat
        if let alpha = a {
            alphaValue = alpha
        } else {
            alphaValue = 1.0
        }
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alphaValue)
    }
    
    
    public convenience init(hexString: String) {
        
        guard let hexColor = ResplendentHexColor(hexString: hexString) else {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            return
        }
        
        self.init(r: Int(hexColor.components.red), g: Int(hexColor.components.green), b: Int(hexColor.components.blue))
    }
    
    
}
