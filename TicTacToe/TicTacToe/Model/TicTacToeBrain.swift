//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    var playTurn = Player.player1
    
    func boardCreator(row: Int, column: Int) -> [[String]] {
        return Array(repeating: Array(repeating: "", count: column), count: row)
    }
}
