//
//  Player.swift
//  TicTacToe
//
//  Created by Levi Davis on 8/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


enum Player {
    
    case playerOne
    case playerTwo
    
    mutating func alternateTurns() {
        switch self {
        case .playerOne:
            self = .playerTwo
        case .playerTwo:
            self = .playerOne
        }
    }
    
}
