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
    
    func fakeSort(_ array: [Int], itterationStep: Int) -> SortResult {
        var copy = array
        for index1 in (0..<copy.count).reversed() {
            for index2 in itterationStep..<index1 {
                print("\(copy[index2]) > \(copy[index2 + 1])")
                if copy[index2] > copy[index2 + 1] {
                    copy.swapAt(index2, index2 + 1)
                    return .swap(first: index2, second: index2 + 1, interiumResult: copy)
                }
                return .highlight(first: index2, second: index2 + 1, itterationStep: index2 + 1)
            }
        }
        return .end(highlight: highlight)
    }
    
}

enum SortResult {
    case swap(first: Int, second: Int, interiumResult: [Int])
    case highlight(first: Int, second: Int, itterationStep: Int)
    case end(highlight: [(Int, Int)])
}
