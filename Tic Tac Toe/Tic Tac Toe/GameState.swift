//
//  GameState.swift
//  Tic Tac Toe
//
//  Created by Michelle Cueva on 8/3/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

struct Game {
    var gamestate = [
        [0,0,0],
        [0,0,0],
        [0,0,0]
    ]
    
    var gameDone = false
    
    
    func isAvailable(row:Int, col: Int) -> Bool {
        return gamestate[row][col] == 0 && !gameDone
    }
    
    mutating func disable(row:Int,col:Int, value: Int)  {
        gamestate[row][col] = value
    }
    
    private func isRowWin(row: Int) -> Bool {
       return gamestate[row][0] == gamestate[row][1] && gamestate[row][0] == gamestate[row][2]
    }
    
    private func isColWin(col: Int) -> Bool {
        return gamestate[0][col] == gamestate[1][col] && gamestate[0][col] == gamestate[2][col]
    }
    
    private func isLRDiagonalWin() -> Bool {
        return gamestate[0][0] == gamestate[1][1] && gamestate[0][0] == gamestate[2][2]
    }
    
    private func isRLDiagonalWin() -> Bool {
        return gamestate[0][2] == gamestate[1][1] && gamestate[0][2] == gamestate[2][0]
    }
    
    func checkWin(row: Int, col: Int) -> Bool {
        
        if isRowWin(row: row) || isColWin(col: col) {
            return true
        }
        
        if row == col && isLRDiagonalWin() {
            return true
        }
        
        if row + col == 2 && isRLDiagonalWin() {
                return true
        }
        
        return false
            
        }
    
    mutating func reset() {
        gamestate = [
            [0,0,0],
            [0,0,0],
            [0,0,0]
        ]
    }
        
}


