//
//  Buble.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class BubbleModel: SortModelProtocol {
    
    var title = "Bubble Sort"
    
    func sort(_ array: [Int]) -> [Int] {
        var copy = array
        for index1 in (0..<copy.count).reversed() {
            for index2 in 0..<index1 {
                if copy[index2] > copy[index2 + 1] {
                    copy.swapAt(index2, index2 + 1)
                }
            }
        }
        return copy
    }
    
    private var highlight = [(Int, Int)]()
    
    func fakeSort(_ array: [Int], itterationStep: Int) -> SortResult {
        var copy = array
        let sortedArray = sort(copy)
        print(sortedArray)
        for index1 in (0..<copy.count).reversed() {
            for index2 in itterationStep..<index1 {
                highlight.append((index2, index2 + 1))
                if copy[index2] > copy[index2 + 1] {
                    copy.swapAt(index2, index2 + 1)
                    return .swap(first: index2, second: index2 + 1, interiumResult: copy)
                }
                if sortedArray.isEqual(copy) {
                    return .end(highlight: highlight)
                } else {
                    return .highlight(first: index2, second: index2 + 1, itterationStep: index2 + 1)
                }
            }
        }
        return .end(highlight: highlight)
    }
    
    
}

extension Array where Element: Equatable {
    func isEqual(_ array2: [Element]) -> Bool {
        if self.count == array2.count {
            for index in 0..<self.count {
                if self[index] == array2[index] {
                    break
                } else {
                    return false
                }
            }
            return true
        }
        return false
    }
}

enum SortResult {
    case swap(first: Int, second: Int, interiumResult: [Int])
    case highlight(first: Int, second: Int, itterationStep: Int)
    case end(highlight: [(Int, Int)])
}
