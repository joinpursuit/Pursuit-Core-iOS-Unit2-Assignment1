//
//  switchPlayer.swift
//  TicTacToe
//
//  Created by hildy abreu on 8/8/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum Player: String {
    case player1 = "O"
    case player2 = "X"
    
    mutating func switchPlayer() {
        switch self {
            
        case .player1:
            self = .player2
        case .player2:
            self = .player1
        }
    }
    
}
