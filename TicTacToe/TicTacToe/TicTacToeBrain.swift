//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

var playerX = false

//var gameView = ViewController()

class TicTacToeBrain {

    var boardMatrix = [["","",""],["","",""],["","",""]]
    
        init() {
        }
    
    func populate(_ gameButton: GameButton) {
        if playerX {
            boardMatrix[gameButton.row][gameButton.col] = "x"
            print(boardMatrix)
        } else {
            boardMatrix[gameButton.row][gameButton.col] = "o"
            print(boardMatrix)
            
        }
    }
    
    
    func winCondition() -> String {
        //var text = gameView.gameStatsLabel.text ?? ""
        //use for loop to go through array matrix
        for arr in boardMatrix {
            for index in arr {
                if index == "x" {
                    return "Player 1 wins"
                } else if index == "o" {
                    return "Player 2 wins"
                }
            }
        }
//        if boardMatrix[0][0] == boardMatrix[0][1] && boardMatrix[0][0] == boardMatrix[0][2] {
//
//        } else if boardMatrix[1][0] == boardMatrix[1][1] && boardMatrix[1][0] == boardMatrix[1][2] {
//
//        } else if boardMatrix[2][0] == boardMatrix[2][1] && boardMatrix[2][0] == boardMatrix[2][2] {
//
//        } else if boardMatrix[0][0] == boardMatrix[1][0] && boardMatrix[0][0] == boardMatrix[2][0] {
//
//        } else if boardMatrix[0][1] == boardMatrix[1][1] && boardMatrix[0][1] == boardMatrix[2][1] {
//
//        } else if boardMatrix[0][2] == boardMatrix[1][2] && boardMatrix[0][2] == boardMatrix[2][2] {
//
//        } else if boardMatrix[0][0] == boardMatrix[1][1] && boardMatrix[0][0] == boardMatrix [2][2] {
//
//        } else if boardMatrix[0][2] == boardMatrix[1][1] && boardMatrix[0][2] == boardMatrix[2][0] {
//
//        }
        return ""
    }
    
    
}

