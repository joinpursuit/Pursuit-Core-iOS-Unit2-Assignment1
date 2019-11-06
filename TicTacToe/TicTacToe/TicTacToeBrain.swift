//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

var playerX = false


class TicTacToeBrain {

    var boardMatrix = [[String]]()
    
    var gameView = ViewController()
    
        init(){
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
        var text = gameView.gameStatsLabel.text ?? ""
        if boardMatrix[0][0] == boardMatrix[0][1] && boardMatrix[0][0] == boardMatrix[0][2] {
            if boardMatrix.contains(["x"]) {
                text = "Player 1 wins"
            } else if boardMatrix.contains(["o"]) {
                text = "Player 2 wins"
            }
        } else if boardMatrix[1][0] == boardMatrix[1][1] && boardMatrix[1][0] == boardMatrix[1][2] {
            if boardMatrix.contains(["x"]) {
                text = "Player 1 wins"
            } else if boardMatrix.contains(["o"]) {
               text = "Player 2 wins"
            }
        } else if boardMatrix[2][0] == boardMatrix[2][1] && boardMatrix[2][0] == boardMatrix[2][2] {
            if boardMatrix.contains(["x"]) {
                text = "Player 1 wins"
            } else if boardMatrix.contains(["o"]) {
                text = "Player 2 wins"
            }
        } else if boardMatrix[0][0] == boardMatrix[1][0] && boardMatrix[0][0] == boardMatrix[2][0] {
            if boardMatrix.contains(["x"]) {
                text = "Player 1 wins"
            } else if boardMatrix.contains(["o"]) {
                text = "Player 2 wins"
            }
        } else if boardMatrix[0][1] == boardMatrix[1][1] && boardMatrix[0][1] == boardMatrix[2][1] {
            if boardMatrix.contains(["x"]) {
                text = "Player 1 wins"
            } else if boardMatrix.contains(["o"]) {
                text = "Player 2 wins"
            }
        } else if boardMatrix[0][2] == boardMatrix[1][2] && boardMatrix[0][2] == boardMatrix[2][2] {
            if boardMatrix.contains(["x"]) {
                text = "Player 1 wins"
            } else if boardMatrix.contains(["o"]) {
                text = "Player 2 wins"
            }
            } else if boardMatrix[0][0] == boardMatrix[1][1] && boardMatrix[0][0] == boardMatrix [2][2] {
            if boardMatrix.contains(["x"]) {
                text = "Player 1 wins"
            } else if boardMatrix.contains(["o"]) {
                text = "Player 2 wins"
            }
        } else if boardMatrix[0][2] == boardMatrix[1][1] && boardMatrix[0][2] == boardMatrix[2][0] {
           if boardMatrix.contains(["x"]) {
                text = "Player 1 wins"
            } else if boardMatrix.contains(["o"]) {
                text = "Player 2 wins"
            }
        }
        return text
    }
    
    
}

