//
//  FirstSreenController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 24/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation

import UIKit

class FirstScreenController: LocalizedUIViewController {

    var game: FlipperModelController?
    var vcPointer: ViewController?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        replaceNavBarButtons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Continue Old Game", let vc = vcPointer {
            if let newVC = segue.destination as? ViewController{
                newVC.game = vc.game
            }
        }
        else if segue.identifier == "Start New Game"{
            vcPointer = segue.destination as? ViewController
        }
        
        
    }
}
