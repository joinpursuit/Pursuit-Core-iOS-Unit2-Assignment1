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
    var gameBoard: [GamePiece]
    let turn: GamePiece
    var player: Int = 1
    var turnCount = 0
    var isWin: Bool {
           return
               gameBoard[0] == gameBoard[1] && gameBoard[0] == gameBoard[2] && gameBoard[0] != .empty ||
               gameBoard[3] == gameBoard[4] && gameBoard[3] == gameBoard[5] && gameBoard[3] != .empty ||
               gameBoard[6] == gameBoard[7] && gameBoard[6] == gameBoard[8] && gameBoard[6] != .empty ||
               gameBoard[0] == gameBoard[3] && gameBoard[0] == gameBoard[6] && gameBoard[0] != .empty ||
               gameBoard[1] == gameBoard[4] && gameBoard[1] == gameBoard[7] && gameBoard[1] != .empty ||
               gameBoard[2] == gameBoard[5] && gameBoard[2] == gameBoard[8] && gameBoard[2] != .empty ||
               gameBoard[0] == gameBoard[4] && gameBoard[0] == gameBoard[8] && gameBoard[0] != .empty ||
               gameBoard[2] == gameBoard[4] && gameBoard[2] == gameBoard[6] && gameBoard[2] != .empty
    }
    
    init(gameBoard: [GamePiece] = [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty], turn: GamePiece = .x) {
           self.gameBoard = gameBoard
           self.turn = turn
           }
    
    mutating func placePiece(_ button: GameButton) {
        if gameBoard[button.position] == .empty {
            if player == 1 {
                gameBoard[button.position] = .x
                button.setBackgroundImage(UIImage(systemName: "sun.max"), for: .normal)
                turnCount += 1
                player += 1
            } else {
                gameBoard[button.position] = .o
                button.setBackgroundImage(UIImage(systemName: "moon"), for: .normal)
                turnCount += 1
                player -= 1
            }
        }
    }
    
    mutating func gameRestart() {
        gameBoard = [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
        player = 1
        turnCount = 0
    }
    
    
}


