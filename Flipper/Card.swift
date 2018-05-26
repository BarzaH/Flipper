//
//  File.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 29/04/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation

struct Card
{
    static var count = 0
    var id = 0
    var isClicked = false
    var isOut = false
    
    init(){
        id = Card.count
        Card.count += 1
    }
    
}
