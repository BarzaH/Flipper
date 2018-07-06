//
//  PhotoControllerViewController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 26/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import UIKit

class PhotoShootViewController:  LocalizableUIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var takePhotoButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        }
        else {
                imagePicker.delegate = self;
                imagePicker.sourceType = .photoLibrary
                present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.saveButton.title = "Save".localized()
    }

}
