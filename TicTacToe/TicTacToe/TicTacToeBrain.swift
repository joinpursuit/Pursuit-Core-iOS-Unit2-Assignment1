//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    
    enum Player: String {
        case playerOne = "X"
        case playerTwo = "O"
        
        mutating func switchPlayer() {
            switch self {
            case .playerOne:
               self = .playerTwo
            case .playerTwo:
                self = .playerOne
            }
        }
    }
   static func winCondition(matrix: [[String]], userSymbol: String) -> Bool {
        //horizontal
        for row in matrix {
            var allMatched = true
            for symbol in row {
                if symbol != userSymbol {
                    allMatched = false
                    break
                }
            }
            if allMatched {
                //print("horizontal")
                return true
            }
        }
        //vertical
        for y in 0..<matrix.count {
            var allMatched = true
            for x in 0..<matrix.count {
                if matrix[x][y] != userSymbol {
                    allMatched = false
                    break
                }
            }
            if allMatched {
                //print("vertical")
                return true
            }
        }
        
        //diagonal
        if matrix[0][0] == userSymbol && matrix[1][1] == userSymbol && matrix[2][2] == userSymbol || matrix[0][2] == userSymbol && matrix[1][1] == userSymbol && matrix[2][0] == userSymbol {
            //print("diagnoal")
            return true
        }
        return false
    }
}
