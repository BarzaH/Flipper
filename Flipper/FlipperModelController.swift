//
//  FlipperModelController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 25/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation

class FlipperModelController{

    var firstChosenCardIndex: Int?
    var flipperModel: FlipperModel
    
    
    var signs = ["🧠", "🎃", "👹", "👿", "🧕🏻", "👨‍👩‍👦‍👦", "🧠", "🎃", "👹", "👿", "🧕🏻", "👨‍👩‍👦‍👦"]
    var signMap = [Int: String]()
    var cardButtonMap = [Int]()
    
    init(amountOfCards: Int){
        flipperModel = FlipperModel(amountOfCards: amountOfCards)
    }
    
    func chooseCard(index: Int){
        
        if firstChosenCardIndex != nil
        {
            
            if signMap[flipperModel.Cards[index].id] == signMap[flipperModel.Cards[firstChosenCardIndex!].id]
            {
                flipperModel.Cards[index].isOut = true
                flipperModel.Cards[firstChosenCardIndex!].isOut = true
            }
            
            
            flipperModel.Cards[index].isClicked = true
            
            firstChosenCardIndex = nil
        }
        else
        {
            for ind in flipperModel.Cards.indices
            {
                flipperModel.Cards[ind].isClicked = false
            }
            
            firstChosenCardIndex = index
            flipperModel.Cards[index].isClicked = true
            
            
        }
    }
    
    
}
