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
    
    func isAvailable(row:Int, col: Int) -> Bool {
        return gamestate[row][col] == 0
    }
    
    mutating func disable(row:Int,col:Int)  {
        gamestate[row][col] = 1
    }
}
