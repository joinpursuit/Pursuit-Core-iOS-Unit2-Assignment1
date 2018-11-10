//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    var player: String
    var symbol: String // X or O
    var color: UIColor
    
    init(player: String, piece: String, color: UIColor) {
        self.player = player
        self.symbol = piece
        self.color = color
    }
    
    static func endGame() -> Bool {
        return true
    }
}


