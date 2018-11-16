//
//  Player.swift
//  TicTacToe
//
//  Created by Jian Ting Li on 11/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

enum Player {
    case player1
    case player2
    
    mutating func switchPlayer() {
        switch self {
        case .player1:
            self = .player2
        case .player2:
            self = .player1
        }
    }
    
    func ticTacToeSymbol() -> String {
        switch self {
        case .player1:
            return "❌"
        case .player2:
            return  "🔵"
        }
    }
}
