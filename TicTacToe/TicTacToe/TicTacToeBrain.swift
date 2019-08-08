//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation
import UIKit

struct TicTacToeBrain {
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
   mutating func updateGameState(activePlayer: Int, senderTag: Int) {
    gameState[senderTag - 1] = activePlayer

    }
    
   mutating func checkGameStatus() -> GameStatus {
        for i in winningCombos {
            if gameState[i[0]] != 0 && gameState[i[0]] == gameState[i[1]] && gameState[i[1]] == gameState[i[2]] {
                if gameState[i[0]] == 1 {
                    return .playerOneWins
                } else if gameState[i[0]] == 2 {
                    return .playerTwoWins
                } else {
                    return .ongoing
                }
            }
        }
        return .ongoing
    }
}

