//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    var board: [[Int]] = [[], [], [],
                          [], [], [],
                          [], [], []]
    var winConditions = [[0,0], [0,1], [0,2]]
    var turn = 1
}
