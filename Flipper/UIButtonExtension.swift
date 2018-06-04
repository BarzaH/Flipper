//
//  UIButtonExtension.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 03/06/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    @IBInspectable
    var img: UIImage{
        get{
            return self.backgroundImage(for: .normal)!
        }
        set{
            self.setBackgroundImage(newValue, for: .normal)
        }
    }
}
