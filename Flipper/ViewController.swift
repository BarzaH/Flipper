//
//  ViewController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 29/04/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import UIKit
import Localize_Swift

class ViewController: LocalizedUIViewController {

    lazy var game = FlipperModelController(amountOfCards: cardButtons.count)

    var backgroundImage: UIImage?
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipsLabel: UILabel!
    
    @IBAction func buttonClick(_ sender: UIButton){
        game.flips += 1

        if let buttonIndex = cardButtons.index(of: sender)
        {
            let cardIndex = game.cardButtonMap.index(of: buttonIndex)
            game.chooseCard(index: cardIndex!)

        }
        
        updateView()
    }
    
    
    func updateView(){
        
        flipsLabel.text = "Flips Count:".localized() + "\(game.flips)"
        
        for index in game.cards.indices
        {
            let card = game.getCard(index:index)
            let button = cardButtons[game.cardButtonMap[index]]
            
            if game.signMap[card.id] == nil{
                let rndm = Int(arc4random_uniform(UInt32(game.signs.count)))
                game.signMap[card.id] = game.signs[rndm]
                game.signs.remove(at: rndm)
            }
            
            if(card.isClicked)
            {
                
                button.setTitle(game.signMap[card.id]!, for: UIControlState.normal)
                button.setBackgroundImage(nil, for: .normal)
            }
            else{
                button.setBackgroundImage(backgroundImage, for: .normal)
                button.setTitle("", for: UIControlState.normal)
            }
            
            if(card.isOut)
            {
                button.setBackgroundImage(nil, for: .normal)
            }
            
            if(game.cardsLeft == 0){
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { [weak self] in
                    self?.cardButtons.forEach { (b) in
                        button.setTitle("", for: UIControlState.normal)
                    }
                })
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackgroundImage), name: NSNotification.Name(rawValue: "New image"), object: nil)
        
        game.matchCardsAndButtons(indices: cardButtons.indices)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBackgroundImage()
    }
    
    @objc func updateBackgroundImage() {
        let backgroundImageManager = BackgroundImageManager()
        
        self.backgroundImage = backgroundImageManager.fetch()
        
        updateView()
    }
    
}

