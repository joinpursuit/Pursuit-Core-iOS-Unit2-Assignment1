//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    var isPlayerOneTurn = false
    static var gameBoard: [[String]] = [["","",""],["","",""],["","",""]]
    
    func alternateTurn(){
        isPlayerOneTurn = !isPlayerOneTurn
    }
    
    func markChoice() -> String {
        if self.isPlayerOneTurn {
            return "X"
        } else {
            return "O"
        }
    }
    
    func displayTurnPlayer() -> String {
        if self.isPlayerOneTurn {
            return "Player 1"
        } else {
            return "Player 2"
        }
    }
    
    func confirmWinCondition() -> Bool {
        for index in 0...2 {
            //check horizontals
            if TicTacToeBrain.gameBoard[index][0] == TicTacToeBrain.gameBoard[index][1] && TicTacToeBrain.gameBoard[index][0] == TicTacToeBrain.gameBoard[index][2] && TicTacToeBrain.gameBoard[index][0] != "" {
                return true
                //check verticals
            } else if TicTacToeBrain.gameBoard[0][index] == TicTacToeBrain.gameBoard[1][index] && TicTacToeBrain.gameBoard[0][index] == TicTacToeBrain.gameBoard[2][index] && TicTacToeBrain.gameBoard[0][index] != "" {
                return true
                //check downward-right diagonal
            } else if TicTacToeBrain.gameBoard[0][0] == TicTacToeBrain.gameBoard[1][1] && TicTacToeBrain.gameBoard[0][0] == TicTacToeBrain.gameBoard[2][2] && TicTacToeBrain.gameBoard[0][0] != "" {
                return true
                //check upward-right diagonal
            } else if TicTacToeBrain.gameBoard[0][2] == TicTacToeBrain.gameBoard[1][1] && TicTacToeBrain.gameBoard[0][0] == TicTacToeBrain.gameBoard[0][2] && TicTacToeBrain.gameBoard[2][2] != "" {
                return true
            }
        }
        return false
    }
}
