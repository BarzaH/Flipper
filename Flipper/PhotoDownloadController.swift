//
//  PhotoDownloadController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 26/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import UIKit

class PhotoDownloadController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textFieldURL: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func downloadPhoto(_ sender: Any) {
        let url:URL = URL(string: textFieldURL.text!)!
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let urlContents = try? Data(contentsOf: url)
            
            if let imageData = urlContents{
                DispatchQueue.main.async {
                    let img = UIImage(data: imageData)
                    self?.imageView.image = img
//                    self?.imageView.sizeToFit()
                    
                }
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
