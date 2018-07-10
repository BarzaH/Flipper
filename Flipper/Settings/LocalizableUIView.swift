//
//  UIView+Localization.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 06/07/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
extension NSObject{
    private struct AssociatedKeys {
        static var baseText = ""
    }
    
    @IBInspectable var baseText: String! {
        get {
            guard let baseText = objc_getAssociatedObject(self, &AssociatedKeys.baseText) as? String else {
                return String()
            }    
            return baseText
        }
        
        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.baseText, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

