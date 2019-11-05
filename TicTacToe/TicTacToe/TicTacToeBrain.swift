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
    //where you win. array matrix
    //list how the board should look to win
    var boardMatrix = [["","",""],
                       ["","",""],
                       ["","",""]]
    //create new thing to populate empty matrix
    var gameView = ViewController()
    var printStatement : UILabel
    
    init(boardMatrix: [[String]], printStatement: UILabel) {
        self.boardMatrix = boardMatrix
        self.printStatement = printStatement
    }
    
    func populate(_ gameButton: GameButton) -> String {
        if playerX {
            boardMatrix[gameButton.row][gameButton.col] = "xmark"
            gameView.gameStatsLabel.text = "Player 1 won!"
        } else {
            boardMatrix[gameButton.row][gameButton.col] = "circle"
            gameView.gameStatsLabel.text = "Player 2 won!"
        }
        return gameView.gameStatsLabel.text ?? ""
    }
    
    func winCondition() {
        if boardMatrix[0][0] == boardMatrix[0][1] && boardMatrix[0][0] == boardMatrix[0][2] {
            
        } else if boardMatrix[1][0] == boardMatrix[1][1] && boardMatrix[1][0] == boardMatrix[1][2] {
            print()
        } else if boardMatrix[2][0] == boardMatrix[2][1] && boardMatrix[2][0] == boardMatrix[2][2] {
            print()
        } else if boardMatrix[0][0] == boardMatrix[1][0] && boardMatrix[0][0] == boardMatrix[2][0] {
            print()
        } else if boardMatrix[0][1] == boardMatrix[1][1] && boardMatrix[0][1] == boardMatrix[2][1] {
            print()
        } else if boardMatrix[0][2] == boardMatrix[1][2] && boardMatrix[0][2] == boardMatrix[2][2] {
            print()
        }
    }
    
    
}

