//
//  Selection.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class SelectionModel: SortModelProtocol {
    
    var title = "Selection Sort"

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
        let sortedArray = sort(copy)
        
        for index1 in 0..<copy.count {
            minIndex = index1
            for index2 in itterationStep..<copy.count {
                highlight.append((minIndex, index2))
                if copy[minIndex] < copy[index2] {
                    minIndex = index2
                }
                return .highlight(first: minIndex, second: index2, itterationStep: index2 + 1)
            }
            copy.swapAt(index1, minIndex)
            if sortedArray.isEqual(copy) {
                return .swap(first: index1, second: minIndex, interiumResult: copy)
            } else {
                return .end(highlight: [(1, 2)])
            }
        }
        return .end(highlight: [(1, 2)])
    }
}
