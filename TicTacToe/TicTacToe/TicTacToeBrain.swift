//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

public struct TicTacToeImage {
    static let xIcon = "xIcon"
    static let oIcon = "oIcon"
}

class TicTacToeBrain {
    var array = [
        [0,0,0],
        [0,0,0],
        [0,0,0]]
    var playerSwitch = true
    var gameOver = false
    var playerTurnCondition = ""
    var playerIcon = ""
    
    func checkingConditions (a: Int, b: Int) {
        var playerValue: Int
        
        if playerSwitch {
            playerValue = 1
            playerSwitch = false
            playerTurnCondition = "Player Two's Turn!"
            playerIcon = TicTacToeImage.xIcon
            
        } else {
            playerValue = 5
            playerSwitch = true
            playerTurnCondition = "Player One's Turn!"
            playerIcon = TicTacToeImage.oIcon
        }
        array[a][b] += playerValue
        var winArray = [[array[0][0],array[1][1],array[2][2]],
                        [array[2][0],array[1][1],array[0][2]],
                        [array[0][0],array[0][1],array[0][2]],
                        [array[1][0],array[1][1],array[1][2]],
                        [array[2][0],array[2][1],array[2][2]],
                        [array[0][0],array[1][0],array[2][0]],
                        [array[0][1],array[1][1],array[2][1]],
                        [array[0][2],array[1][2],array[2][2]]]
        for i in 0..<winArray.count {
            if winArray[i].reduce(0, +) == 3 {
                playerTurnCondition = "Player One Wins"
                gameOver = true
                break
            } else if winArray[i].reduce(0, +) == 15 {
                playerTurnCondition = "Player Two Wins"
                gameOver = true
                break
            } else if array.joined().reduce(0, +) == 25 {
                playerTurnCondition = "Draw"
                gameOver = true
            }
        }
    }
    func resetGame(a: Bool){
        if a == true {
            array = [
                [0,0,0],
                [0,0,0],
                [0,0,0]]
            gameOver = false
            playerSwitch = true
        }
    }
    
}
