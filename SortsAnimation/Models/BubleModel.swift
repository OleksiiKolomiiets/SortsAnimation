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
    
    private var highlight = [(Int, Int)]()
    
    func fakeSort(_ array: [Int]) -> SortResult {
        var copy = array
        for index1 in (0..<copy.count).reversed() {
            for index2 in 0..<index1 {
                highlight.append((first: index2, sedond: index2 + 1))
                if copy[index2] > copy[index2 + 1] {
                    copy.swapAt(index2, index2 + 1)
                    return .swap(first: index2, sedond: index2 + 1, interiumResult: copy, highlight: highlight)
                }                
            }
        }
        return .end(highlight: highlight)
    }
    
}

enum SortResult {
    case swap(first: Int, sedond: Int, interiumResult: [Int], highlight: [(Int, Int)])
    case end(highlight: [(Int, Int)])
}
