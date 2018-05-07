//
//  SortType.swift
//  SortsAnimation
//
//  Created by Oleksii Kolomiiets on 5/7/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

enum SortType: String {
    case insert, selection, bubble
    
    var model: SortModelProtocol {
        switch self {
        case .insert:
            return InsertModel()
        case .selection:
            return SelectionModel()
        case .bubble:
            return BubbleModel()
        }
    }
}
