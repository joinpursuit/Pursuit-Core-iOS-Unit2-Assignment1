//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Sunni Tang on 08/1/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


class TicTacToeBrain {
    var gameBoard: [[String]] = [["-","-","-"],
                                 ["-","-","-"],
                                 ["-","-","-"]]
    var playerOneCounter = 0
    var playerTwoCounter = 0

    
    func playerOneWins() {
        playerOneCounter += 1
    }
    
    func playerTwoWins() {
        playerTwoCounter += 1
    }
    
    func checkForWin() {
        let row1: [String] = [gameBoard[1][1], gameBoard[1][2], gameBoard[1][3]]
        let row2: [String] = [gameBoard[2][1], gameBoard[2][2], gameBoard[2][3]]
        let row3: [String] = [gameBoard[3][1], gameBoard[3][2], gameBoard[3][3]]
        let col1: [String] = [gameBoard[1][1], gameBoard[2][1], gameBoard[3][1]]
        let col2: [String] = [gameBoard[1][2], gameBoard[2][2], gameBoard[3][2]]
        let col3: [String] = [gameBoard[1][3], gameBoard[2][3], gameBoard[3][3]]
        let dia1: [String] = [gameBoard[1][1], gameBoard[2][2], gameBoard[3][3]]
        let dia2: [String] = [gameBoard[3][1], gameBoard[2][2], gameBoard[1][3]]
        
        //horizontal wins
        if row1 == ["o", "o", "o"] || row2 == ["o", "o", "o"] || row3 == ["o", "o", "o"] {
            playerOneWins()
        } else if row1 == ["x", "x", "x"] || row2 == ["x", "x", "x"] || row3 == ["x", "x", "x"] {
            playerTwoWins()
        }
        
        //vertical wins
        if col1 == ["o", "o", "o"] || col2 == ["o", "o", "o"] || col3 == ["o", "o", "o"] {
            playerOneWins()
        } else if col1 == ["x", "x", "x"] || col2 == ["x", "x", "x"] || col3 == ["x", "x", "x"]  {
            playerTwoWins()
        }
        
        //diagonal wins
        if dia1 == ["o", "o", "o"] || dia2 == ["o", "o", "o"] {
            playerOneWins()
        } else if dia1 == ["x", "x", "x"] || dia2 == ["x", "x", "x"] {
            playerTwoWins()
        }
        
    }

    
}






// Model
// Matrix that controls state of game (update based on user input) - var
// 1. Player switch (case?) -> Player one (assigns o), Player 2 (assigns x)
// mutating func to assign change in matrix,
// 3. Func for all winning combos (8 Combos), check for win condition. where tag.X == tag.Y == tag.Z.


// Controller
// 1a. Depending on player, change label
// 1b. Depending on player, change button image when pressed. Disable buttons


// View
// 1a. Sees whose turn based on player (label)
// 1b. Press button, image based on player

