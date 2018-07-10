//
//  BackgroundImageManager.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 04/06/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation
import UIKit

class BackgroundImageManager {
    
    let fileManager: FileManager
    let documentURL: URL
    let documentPath: String
    let filePath: URL
    let imageName: String = "card-back"
    
    static let shared = BackgroundImageManager()
    
    
    private init(){
        fileManager = FileManager.default
        documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        documentPath = documentURL.path
        filePath = documentURL.appendingPathComponent("card-back.png")
        
    }
    
    func fetch() -> UIImage?{
        if fileManager.fileExists(atPath: filePath.path){
            return UIImage(contentsOfFile: filePath.path)!
        }
        else{
            return nil
        }
        
    }
    
    func write(image: UIImage){
        if fileManager.fileExists(atPath: filePath.path){
            try? fileManager.removeItem(at: filePath)
        }
        
        fileManager.createFile(atPath: filePath.path, contents: UIImagePNGRepresentation(image))
    }
    
    func delete(){
        if fileManager.fileExists(atPath: filePath.path){
            try? fileManager.removeItem(at: filePath)
        }
    }
}
