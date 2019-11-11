//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    var board: [Int] =   [2, 2, 2,
                          2, 2, 2,
                          2, 2, 2]
    
    var winningCombos = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    
    var turn = 1
    var player1Score = 0
    var player2Score = 0
    var x = 1
    var o = 0
    var empty = 2
    var winner = false
}

