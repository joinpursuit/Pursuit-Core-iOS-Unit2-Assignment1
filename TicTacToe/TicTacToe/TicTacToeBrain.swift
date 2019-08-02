//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


class TicTacToeBrain {
    var gameBoard: [[String]] = [["-","-","-"],
                                 ["-","-","-"],
                                 ["-","-","-"]]
    
    func updateBoard() {
    
    }
    
    func checkForWin() {
        
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

