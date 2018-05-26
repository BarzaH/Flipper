//
//  AB.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 26/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation

class AB{
    var a:Int?
    let b: Int
    
    required init(_ a: inout Int)
    {
        self.a = a
        a = 100
        b = 12
    }
    
    func changeA(_ a: inout Int){
        print("\(a)")
    }
}
