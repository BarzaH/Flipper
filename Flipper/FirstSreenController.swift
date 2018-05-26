//
//  FirstSreenController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 24/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation

import UIKit

class FirstScreenController: UIViewController {

    var game: FlipperModelController?
    
    
    @IBAction func newGame(_ sender: Any) {
        self.game = nil
        performSegue(withIdentifier: "Start New Game", sender: sender)
    }
    
    @IBAction func continueOldGame(_ sender: Any) {
        performSegue(withIdentifier: "Continue Old Game", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Continue Old Game", let oldGame = game {
            if let vc = segue.destination as? ViewController {
                vc.game = oldGame
            }
        }
    }
}
