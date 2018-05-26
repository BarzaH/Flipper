//
//  ViewController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 29/04/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = FlipperModelController(amountOfCards: cardButtons.count)
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipsLabel: UILabel!
    
    @IBAction func buttonClick(_ sender: UIButton){
        game.flipperModel.flips += 1
        
        if let buttonIndex = cardButtons.index(of: sender)
        {
            let cardIndex = game.cardButtonMap.index(of: buttonIndex)
            game.chooseCard(index: cardIndex!)
        }
        
        updateView()
    }
    
    
    func updateView(){
        
        flipsLabel.text = "Flip Count: \(game.flipperModel.flips)"
        
        for index in game.flipperModel.Cards.indices
        {
            let card = game.flipperModel.Cards[index]
            let button = cardButtons[game.cardButtonMap[index]]
            
            if(card.isClicked)
            {
        
                if game.signMap[card.id] == nil{
                    let rndm = Int(arc4random_uniform(UInt32(game.signs.count)))
                    game.signMap[card.id] = game.signs[rndm]
                    game.signs.remove(at: rndm)
                }
                
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(game.signMap[card.id]!, for: UIControlState.normal)
                
            }
            else{
                
                if(card.isOut)
                {
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                }
                else
                {
                    button.backgroundColor = #colorLiteral(red: 0.3844786907, green: 0.9960784314, blue: 0.2322846389, alpha: 1)
                }
                button.setTitle("", for: UIControlState.normal)
            }
        }
        
    }
    
    override func viewDidLoad() {
        var unusedButtonsIndices = Array(cardButtons.indices)

        for _ in game.flipperModel.Cards.indices
        {
            let rndm = Int(arc4random_uniform(UInt32(unusedButtonsIndices.count)))
            game.cardButtonMap.append(unusedButtonsIndices[rndm])
            unusedButtonsIndices.remove(at: rndm)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
        
    }
    
}

