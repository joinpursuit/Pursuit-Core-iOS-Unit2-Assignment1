//
//  Players.swift
//  TicTacToe
//
//  Created by Sunni Tang on 8/2/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum Player {
    case playerOne
    case playerTwo
    
    mutating func switchPlayer() {
        switch self {
        case .playerOne:
            self = .playerTwo
        case .playerTwo:
            self = .playerOne
        }
    }
    
}
