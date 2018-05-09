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
    var array: [Int] { get }
    var result: [(indexes: [Int], isSwap: Bool)] { get set }
}
