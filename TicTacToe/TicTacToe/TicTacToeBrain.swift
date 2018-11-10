//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    var array = [
        [0,0,0],
        [0,0,0],
        [0,0,0]]
    var playerToggle = true
    var gameOver = false
    var gameString = "Player One's Turn!"
    var imageChange = "smile"
    func thinking (a: Int, b: Int) {
        var playerValue: Int
        if playerToggle {
            playerValue = 1
            playerToggle = false
            gameString = "Player Two's Turn!"
            imageChange = "O"
            
        } else {
            playerValue = 4
            playerToggle = true
            gameString = "Player One's Turn!"
            imageChange = "X"
        }
        array[a][b] += playerValue
        print(array)
        print(array[1].reduce(0, +))
        
        for i in 0..<array.count {
            if array[i].reduce(0, +) == 12 {
                gameString = "Player 2 wins"
                gameOver = true
                
            } else if array[i].reduce(0, +) == 3 {
                gameString = "Player 1 wins"
                gameOver = true
            } else if array.joined().reduce(0, +) == 21 {
                gameOver = true
                gameString = "Draw!"
            }
            for j in 0..<array.count {
                print(array[j][i])
                
            }
        }

    }
}
// THIS IS WHERE YOU MODEL YOUR LOGIC
