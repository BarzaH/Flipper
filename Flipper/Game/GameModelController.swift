//
//  FlipperModelController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 25/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation

class GameModelController{
    
    private var gameModel: GameModel
    
    var signs = ["🧠", "🎃", "👹", "👿", "🧕🏻", "👨‍👩‍👦‍👦", "🧠", "🎃", "👹", "👿", "🧕🏻", "👨‍👩‍👦‍👦"]
    var signMap = [Int: String]()
    var cardButtonMap = [Int]()
    var cardsLeft:Int{
        get{
            return gameModel.Cards.filter({ (c) -> Bool in
                !c.isOut
            }).count
        }
    }
    
    var firstChosenCardIndex: Int?
    
    var cards:[Card] {
        get{
            return gameModel.Cards
        }
    }
    
    var flips:Int {
        get{
            return gameModel.flips
        }
        set{
            gameModel.flips = newValue
        }
    }
    
    var cardsCount:Int {
        get{
            return gameModel.Cards.count
        }
    }
    
    
    init(amountOfCards: Int){
        gameModel = GameModel(amountOfCards: amountOfCards)
    }
    
    func chooseCard(index: Int){
        guard gameModel.Cards[index].isOut == false && gameModel.Cards[index].isClicked == false
            else{
                return
        }
        
        
        if firstChosenCardIndex != nil{
            if signMap[gameModel.Cards[index].id] == signMap[gameModel.Cards[firstChosenCardIndex!].id]{
                gameModel.Cards[index].isOut = true
                gameModel.Cards[firstChosenCardIndex!].isOut = true
            }
            
            gameModel.Cards[index].isClicked = true
            
            firstChosenCardIndex = nil
        }
        else{
            for ind in gameModel.Cards.indices{
                gameModel.Cards[ind].isClicked = false
            }
            
            firstChosenCardIndex = index
            gameModel.Cards[index].isClicked = true
        }
    }
    
    func matchCardsAndButtons(indices: CountableRange<Int>){
        var unusedButtonsIndices = Array(indices)
        for _ in gameModel.Cards.indices{
            let rndm = Int(arc4random_uniform(UInt32(unusedButtonsIndices.count)))
            cardButtonMap.append(unusedButtonsIndices[rndm])
            unusedButtonsIndices.remove(at: rndm)
        }
    }
    
    func getCard(index:Int) -> Card{
        return gameModel.Cards[index]
    }
    
}
