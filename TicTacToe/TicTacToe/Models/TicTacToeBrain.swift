//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
  var gameBoard = [["-", "-", "-"],
                    ["-", "-", "-"],
                    ["-", "-", "-"]]
    
    func updateGameBoard(player: Players, row: Int, col: Int) {
        switch player {
        case .player1:
            gameBoard[row][col] = "X"
        case .player2:
            gameBoard[row][col] = "O"
        }
    }
    
    func checkGameState() -> GameState {
        // horizontal check
        for row in gameBoard {
            if row == ["X", "X", "X"] {
                return .player1Wins
            } else if row == ["O", "O", "O"] {
                return .player2Wins
            }
        }
        
        // vertical check
        for columnIndex in 0..<gameBoard[0].count {
            var column = [String]()
            for rowIndex in 0..<gameBoard.count {
                column.append(gameBoard[rowIndex][columnIndex])
                if column == ["X", "X", "X"] {
                    return .player1Wins
                } else if column == ["O", "O", "O"] {
                    return .player2Wins
                }
            }
        }
        
        // diagonal check
        var diagonal1 = [String]()
        var diagonal2 = [String]()
        for i in 0..<gameBoard.count {
            diagonal1.append(gameBoard[i][i])
            diagonal2.append(gameBoard[i][gameBoard.count - 1 - i])
        }
        if diagonal1 == ["X", "X", "X"] || diagonal2 == ["X", "X", "X"] {
            return .player1Wins
        } else if diagonal1 == ["O", "O", "O"] || diagonal2 == ["O", "O", "O"] {
            return .player2Wins
        }
        
        return .ongoing
    }
}
