//
//  FlipperModelController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 25/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation

class FlipperModelController{

    private var flipperModel: FlipperModel
    
    var signs = ["🧠", "🎃", "👹", "👿", "🧕🏻", "👨‍👩‍👦‍👦", "🧠", "🎃", "👹", "👿", "🧕🏻", "👨‍👩‍👦‍👦"]
    var signMap = [Int: String]()
    var cardButtonMap = [Int]()
    var cardsLeft:Int{
        get{
            return flipperModel.Cards.filter({ (c) -> Bool in
                !c.isOut
            }).count
        }
    }
    
    var firstChosenCardIndex: Int?
    
    var cards:[Card] {
        get{
            return flipperModel.Cards
        }
    }
    
    var flips:Int {
        get{
            return flipperModel.flips
        }
        set{
            flipperModel.flips = newValue
        }
    }
    
    var cardsCount:Int {
        get{
            return flipperModel.Cards.count
        }
    }
    
    
    init(amountOfCards: Int){
        flipperModel = FlipperModel(amountOfCards: amountOfCards)
    }
    
    func chooseCard(index: Int){
        guard flipperModel.Cards[index].isOut == false && flipperModel.Cards[index].isClicked == false  else{
            return
        }
        

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
    
    func matchCardsAndButtons(indices: CountableRange<Int>){
        var unusedButtonsIndices = Array(indices)
        
        for _ in flipperModel.Cards.indices
        {
            let rndm = Int(arc4random_uniform(UInt32(unusedButtonsIndices.count)))
            cardButtonMap.append(unusedButtonsIndices[rndm])
            unusedButtonsIndices.remove(at: rndm)
        }
    }
    
    func getCard(index:Int) -> Card{
        return flipperModel.Cards[index]
    }
    
}
