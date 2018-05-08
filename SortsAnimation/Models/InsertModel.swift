//
//  Insert.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class InsertModel: SortModelProtocol {
    var title = "Insert Sort"
    
    func fakeSort(_ array: [Int], itterationStep: Int) -> SortResult {
        return .end(highlight: [(1, 2)])
    }
    
    func sort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && isOrderedBefore(temp, a[y - 1]){
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
        }
        print(a)
        return a
    }
    
    func isOrderedBefore(_ a: Int, _ b: Int) -> Bool {
        return a < b
    }

}
