//
//  Selection.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class SelectionModel: SortModelProtocol {
    
    init() {
        result = selectionSort(array)
    }
    var result = [resultItem]()
    var title = "Selection Sort"
    var array = [4, 2, 3, 13, 1]  {
        didSet {
            result = selectionSort(array)
        }
    }
    
    private func selectionSort(_ array: [Int]) -> [resultItem] {
        var result = [resultItem]()
        var a = array
        for x in 0 ..< a.count - 1 {
            var lowest = x
            for y in x + 1 ..< a.count {
                result.append((indexes: [y, lowest], isSwap: false))
                if a[y] < a[lowest] {
                    lowest = y
                    result.append((indexes: [y, lowest], isSwap: false))
                }
            }
            if x != lowest {
                a.swapAt(x, lowest)
                result.append((indexes: [x, lowest], isSwap: true))
            }
        }
        return result
    }
}
