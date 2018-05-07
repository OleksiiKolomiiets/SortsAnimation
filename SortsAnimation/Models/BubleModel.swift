//
//  Buble.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class BubbleModel: SortModelProtocol {
    
    func sort(_ array: [Int]) -> [Int] {
        var copy = array
        for index1 in (0..<copy.count).reversed() {
            for index2 in 0..<index1 {
                if copy[index2] > copy[index2 + 1] {
                    copy.swapAt(index2, index2 + 1)
                    return copy
                }
            }
        }
        return copy
    }
    
    init() {
        print("BubbleModel")
    }
    
    func fakeSort(_ array: [Int]) -> SortResult {
        var copy = array
        for index1 in (0..<copy.count).reversed() {
            for index2 in 0..<index1 {
                if copy[index2] > copy[index2 + 1] {
                    copy.swapAt(index2, index2 + 1)
                    return .result(index2, index2 + 1)
                }
            }
        }
        return .end
    }
    
}

enum SortResult {
    case result(Int, Int)
    case end
}
