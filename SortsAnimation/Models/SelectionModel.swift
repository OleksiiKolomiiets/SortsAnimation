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
    
    private var highlight = [(Int, Int)]()
    
    func fakeSort(_ array: [Int], itterationStep: Int) -> SortResult {
        var copy = array
        var minIndex = 0
        var sortedArray = sort(copy)
        
        for index1 in 0..<copy.count {
            minIndex = index1
            for index2 in index1..<copy.count {
                if copy[minIndex] > copy[index2] {
                    minIndex = index2
                }
                return .highlight(first: minIndex, second: index2, itterationStep: index2)
            }
            copy.swapAt(index1, minIndex)
            return .swap(first: index1, second: minIndex, interiumResult: copy)
        }
        return .end(highlight: [(1, 2)])
    }
}
