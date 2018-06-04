//
//  PhotoDownloadController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 26/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import UIKit

class PhotoDownloadController: LocalizedUIViewController {

    @IBOutlet weak var textFieldURL: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func downloadPhoto(_ sender: Any) {
        let url:URL = URL(string: textFieldURL.text!)!
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let urlContents = try? Data(contentsOf: url)
            
            if let imageData = urlContents{
                DispatchQueue.main.async {
                    let img = UIImage(data: imageData)
                    self?.imageView.image = img
                }
            }
        }
        
    }
    
    
    @IBAction func showSizeOfImage(_ sender: UIBarButtonItem) {
        
        
    }
    @IBAction func save(_ sender: Any) {
        let backgroundImageManager = BackgroundImageManager()
        backgroundImageManager.write(image: imageView.image!)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "New image"), object: nil)
    }
    
}
