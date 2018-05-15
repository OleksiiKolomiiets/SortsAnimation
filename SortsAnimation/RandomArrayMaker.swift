//
//  RandomArrayMaker.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/9/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class RandomArrayMaker {
    init(capasity: Int) {
        self.array = generateArray(of: capasity)
    }
    var array = [Int]()
    func generateArray(of capasity: Int) -> [Int] {
        var generatedArray: [Int] = []
        
        for _ in 0..<capasity {
            generatedArray.append(10 + capasity.arc4random)
        }
        return generatedArray
    }
}
    
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

