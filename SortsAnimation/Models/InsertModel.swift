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
    var result = [resultItem]()
    var array = [4, 2, 3, 13, 1] {
        didSet {
            result = sort(array)
        }
    }
    var title = "Insert Sort"
    
    private func sort(_ array: [Int]) -> [resultItem] {
        var result = [resultItem]()
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
