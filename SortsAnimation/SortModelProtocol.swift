//
//  SortModelProtocol.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

protocol SortModelProtocol: class {
    var title: String { get }
    var array: [Int] { get set }
    var result: [resultItem] { get set }
}

typealias resultItem = (indexes: [Int], isSwap: Bool)
