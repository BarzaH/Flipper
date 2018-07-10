//
//  ViewController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 29/04/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import UIKit
import Localize_Swift

class GameViewController: LocalizableUIViewController {
    
    @IBOutlet var cardButtons: [UIGameCardView]!
    @IBOutlet weak var flipsLabel: UILabel!
    
    lazy var game = GameModelController(amountOfCards: cardButtons.count)
    
    
    @IBAction func buttonClick(_ sender: UIGameCardView){
        game.flips += 1
        if let buttonIndex = cardButtons.index(of: sender){
            let cardIndex = game.cardButtonMap.index(of: buttonIndex)
            game.chooseCard(index: cardIndex!)
        }
        updateView()
    }
    
    
    func updateView(){
        flipsLabel.text = "Flips Count:".localized() + " \(game.flips)"
        
        for index in game.cards.indices{
            let cardModel = game.getCard(index:index)
            let cardButton = cardButtons[game.cardButtonMap[index]]
            
            if game.signMap[cardModel.id] == nil{
                let rndm = Int(arc4random_uniform(UInt32(game.signs.count)))
                game.signMap[cardModel.id] = game.signs[rndm]
                game.signs.remove(at: rndm)
            }
            
            if(cardModel.isClicked)
            {
                cardButton.setTitle(game.signMap[cardModel.id]!, for: UIControlState.normal)
            }
            else{
                cardButton.setTitle("", for: UIControlState.normal)
            }
            
            if !cardModel.isOut && cardButton.isUp != cardModel.isClicked {
                cardButton.isUp = cardModel.isClicked
            }
            
            if cardModel.isOut && !cardButton.isUp
            {
                cardButton.isUp = true
            }
            
            if(game.cardsLeft == 0){
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { [weak self] in
                    self?.cardButtons.forEach { (b) in
                        cardButton.setTitle("", for: UIControlState.normal)
                    }
                })
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.matchCardsAndButtons(indices: cardButtons.indices)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
}

