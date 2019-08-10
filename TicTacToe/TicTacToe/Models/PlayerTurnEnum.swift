//
//  PlayerTurnEnum.swift
//  TicTacToe
//
//  Created by Liana Norman on 8/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


enum Players: String {
    case player1 = "O"
    case player2 = "X"
    
    mutating func alternatePlayers() {
        switch self {
        case .player1:
            self = .player2
        case .player2:
            self = .player1
        }
    }
    
}


