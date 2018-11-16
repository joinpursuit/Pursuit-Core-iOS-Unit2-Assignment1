//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    
    static func boardCreator(row: Int, column: Int) -> [[String]] {
        return Array(repeating: Array(repeating: "", count: column), count: row)
    }
    
    static func checkForWin(matrix: [[String]], playerSymbol: String) -> Bool {
        //horizontal
        for arr in matrix {
            var allMatched = true
            for symbol in arr {
                guard symbol == playerSymbol else {
                    allMatched = false
                    break
                }
            }
            if allMatched {return true}
        }
        
        //vertical
        for y in 0..<matrix.count {
            var allMatched = true
            for x in 0..<matrix.count {
                guard matrix[x][y] == playerSymbol else {
                    allMatched = false
                    break
                }
            }
            if allMatched {return true}
        }
        
        //diagonals
        for num in 1...2 {
            var allMatched = true
            switch num {
            case 1:
                var x = 0
                var y = 0
                for _ in 0..<matrix.count {
                    guard matrix[x][y] == playerSymbol else {
                        allMatched = false
                        break
                    }
                    x += 1
                    y += 1
                }
            case 2:
                var x = matrix.count - 1
                var y = 0
                for _ in 0..<matrix.count {
                    guard matrix[x][y] == playerSymbol else {
                        allMatched = false
                        break
                    }
                    x -= 1
                    y += 1
                }
            default:
                print("Something is wrong here")
            }
            if allMatched {return true}
        }
        return false
    }
    
}
