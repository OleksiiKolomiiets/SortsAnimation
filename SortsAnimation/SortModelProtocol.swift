//
//  SortModelProtocol.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

protocol SortModelProtocol {
    func fakeSort(_ array: [Int], itterationStep: Int) -> SortResult
}
