//
//  PhotoDownloadController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 26/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import UIKit

class PhotoDownloadController: LocalizableUIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var sizeButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var textFieldURL: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let backgroundImageManager = BackgroundImageManager.shared
    
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
    
    
    @IBAction func save(_ sender: Any) {
        backgroundImageManager.write(image: imageView.image!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ImageSizePopoverViewController{
            if let pvc = vc.popoverPresentationController{
                pvc.permittedArrowDirections = UIPopoverArrowDirection.any
                pvc.delegate = self
                vc.sizeOfImage = UIImagePNGRepresentation(self.imageView.image!)?.count
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sizeButton.title = "Show size".localized()
        self.saveButton.title = "Save".localized()
        
        self.imageView.image = BackgroundImageManager.shared.fetch() ?? UIImage(named: BackgroundImageManager.shared.imageName, in:Bundle(for: self.classForCoder), compatibleWith: traitCollection)
    }
    
    @IBAction func restoreDefaultImage(_ sender: UIButton) {
        BackgroundImageManager.shared.delete()
        self.imageView.image = UIImage(named: BackgroundImageManager.shared.imageName, in:Bundle(for: self.classForCoder), compatibleWith: traitCollection)
    }
    
}
