//
//  Flipper.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 29/04/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation

struct GameModel
{
    var Cards:[Card] = []
    var flips: Int = 0
    
    
    init(amountOfCards: Int){
        
        for _ in 0..<amountOfCards
        {
            let card = Card()
            
            Cards.append(card)
        }
        
    }
    
    
}
