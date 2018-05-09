//
//  Insert.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class InsertModel: SortModelProtocol {
    
    init() {
        result = sort(array)
    }
    var result = [(indexes: [Int], isSwap: Bool)]()
    var array = [4, 2, 3, 13, 1]
    var title = "Insert Sort"
    
    private func sort(_ array: [Int]) -> [(indexes: [Int], isSwap: Bool)] {
        var result = [(indexes: [Int], isSwap: Bool)]()
        var a = array
        for x in 1..<a.count {
            var y = x
            while y > 0 && a[y] < a[y - 1] {
                result.append((indexes: [y, y - 1], isSwap: false))
                if a[y] < a[y - 1] {
                    result.append((indexes: [y, y - 1], isSwap: true))
                    a.swapAt(y - 1, y)
                    y -= 1
                }
            }
        }
        return result
    }
}
