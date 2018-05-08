//
//  Selection.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class SelectionModel: SortModelProtocol {

    func sort(_ array: [Int]) -> [Int] {
        var copy = array
        var minIndex = 0
        
        for index1 in 0..<copy.count {
            minIndex = index1
            for index2 in index1..<copy.count {
                if copy[minIndex] > copy[index2] {
                    minIndex = index2
                }
            }
            copy.swapAt(index1, minIndex)
        }
        return copy
    }
    
    init() {
        print("SelectionModel")
    }
    
    func fakeSort(_ array: [Int]) -> SortResult {
        var copy = array
        var minIndex = 0
        
        for index1 in 0..<copy.count {
            minIndex = index1
            for index2 in index1..<copy.count {
                if copy[minIndex] > copy[index2] {
                    minIndex = index2
                }
                
            }
            copy.swapAt(index1, minIndex)
            return .result(index1, minIndex, copy)
        }
        return .end
    }
}
