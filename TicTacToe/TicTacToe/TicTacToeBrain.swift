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
    var gameString = ""
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
        var winArray = [[array[0][0],array[1][1],array[2][2]],[array[2][0],array[1][1],array[0][2]],
                         [array[0][0],array[0][1],array[0][2]],[array[1][0],array[1][1],array[1][2]],[array[2][0],array[2][1],array[2][2]],
                         [array[0][0],array[1][0],array[2][0]],[array[0][1],array[0][1],array[0][2]],[array[0][2],array[1][2],array[2][2]]]
        for j in 0..<winArray.count {
            if winArray[j].reduce(0, +) == 12 {
                gameString = "Player 2 wins"
                gameOver = true
            } else if winArray[j].reduce(0, +) == 3 {
                gameString = "Player 1 wins"
                gameOver = true
            }
        }
    }
    func reset(a: Bool){
        if a {
            array = [
                [0,0,0],
                [0,0,0],
                [0,0,0]]
        }
    }
}
// THIS IS WHERE YOU MODEL YOUR LOGIC
