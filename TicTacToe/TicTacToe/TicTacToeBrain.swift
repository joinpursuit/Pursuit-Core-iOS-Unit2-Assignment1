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
    var winningX = ["x","x","x"]
    var winningO = ["o","o","o"]
    var compareColX = [""]
    var compareColO = [""]
    
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
        var boardcount = boardMatrix.count - 1
        var count = 0
        for arr in boardMatrix {
            
            //comparing rows
            if arr == winningX {
                return "Player 1 wins"
            } else if arr == winningO {
                return "Player 2 wins"
            }
            
            //comparing colums
            for str in arr {
                if count < boardcount {
                 count += 1
                    
                }
                
                
//                if str == "x" {
//                    compareColX.append(str)
//                    if compareColX[index] == winningX[index] {
//                        return "Player 1 wins"
//                    }
//                } else if str == "o" {
//                    compareColO.append(str)
//                    if compareColO[index] == winningO[index] {
//                        return "Player 2 wins"
//                    }
//                }
            }
        } 
        return ""
    }
    

    
    
    
}

