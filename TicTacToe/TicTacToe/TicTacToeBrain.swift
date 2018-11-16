//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    //this class should handle your logic
    //function that puts an input, where it is in your game
    //function that checks for a winning condition
    //whose turn it is should NOT be in the viewController
  //once a square is selected it should not be able to be selected again bc of how tic tac toe works
    //hidden and being transparent are not the same thing

    enum Player {
        case playerOne
        case playerTwo
        
        mutating func switchPlayer() {
            switch self {
            case .playerOne:
               self = .playerTwo
            case .playerTwo:
                self = .playerOne
            }
        }
    }
}
