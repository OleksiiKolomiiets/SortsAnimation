//
//  Buble.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class BubbleModel: SortModelProtocol {
    
    init() {
        result = sort(array)
    }
    var result = [resultItem]()
    var array = [4, 2, 3, 13, 1] {
        didSet {
            result = sort(array)
        }
    }
    
    var title = "Bubble Sort"
    
    func sort(_ array: [Int]) -> [resultItem] {
        var copy = array
        var result = [resultItem]()
        for index1 in (0..<copy.count).reversed() {
            for index2 in 0..<index1 {
                result.append((indexes: [index2, index2 + 1], isSwap: false))
                if copy[index2] > copy[index2 + 1] {
                    result.append((indexes: [index2, index2 + 1], isSwap: true))
                    copy.swapAt(index2, index2 + 1)
                }
            }
        }
        return result
    }    
}
