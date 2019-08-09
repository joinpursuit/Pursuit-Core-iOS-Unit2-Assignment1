//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Mariel Hoepelman on 8/8/19.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    
    var turn:Int = 0
    var board:[String] = Array(repeating: " ", count: 9)
    
    let winCombinations = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
    ]

    var winner:Bool {
        for winCombination in winCombinations {
            let winIndexOne = winCombination[0]
            let winIndexTwo = winCombination[1]
            let winIndexThree = winCombination[2]
            
            let positionOne = board[winIndexOne]
            let positionTwo = board[winIndexTwo]
            let positionThree = board[winIndexThree]
            
            if (positionOne == Players.X && positionTwo == Players.X && positionThree == Players.X) || (positionOne == Players.O && positionTwo == Players.O && positionThree == Players.O) {
                return true
            }
        }
        return false
    }
    
    var boardIsFull: Bool {
        for index in board where index == " " {
            return false
        }
        return true
    }
    
    var currentPlayer: String {
        if turn % 2 == 0 {
            return Players.X
        } else {
            return Players.O
        }
    }
    
    func start() -> Void {
        turn = 0
        board = Array(repeating: " ", count: 9)
    }
    
}
