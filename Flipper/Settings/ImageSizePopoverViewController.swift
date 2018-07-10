//
//  ImageSizePopoverViewController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 04/06/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation
import UIKit

class ImageSizePopoverViewController: LocalizableUIViewController{
    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sizeNumber: UILabel!
    
    var sizeOfImage: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sizeNumber.text = "\(sizeOfImage!/1024)"
    }
}
