//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    var activePlayer = 1 // cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    
    
    func gameButtonPressed(_ gameButton: GameButton) {
    
        if gameState[gameButton.tag] == 0 {
            gameState[gameButton.tag] = activePlayer
            
            if activePlayer == 1 {
                gameButton.setImage(UIImage(named: "cross"), for: .normal)
                activePlayer = 2
            } else {
                gameButton.setImage(UIImage(named: "nought"), for: .normal)
                activePlayer = 1
            }
            //        print(" row \(gameButton.row) at column \(gameButton.col) was pressed")
//            for combination in winningCombinations {
//                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
//                    gameIsActive = false
//                    if gameState[combination[0]] == 1 {
//
//                        print("cross has won")
//                    } else {
//                        print("circle has won")
//                    }
//                }
//            }
        }
    }
    var xorOWin = ""

    func winner() {
    for combination in winningCombinations {
        if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
            gameIsActive = false
            if gameState[combination[0]] == 1 {
                xorOWin = "X wins"
                print("cross has won")
            } else {
                print("circle has won")
                xorOWin = "O wins"
            }
            
            gameIsActive = false
            
             
        } else  {
            gameIsActive = false

        for spot in gameState {
            if spot == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false {
            xorOWin = "It's a draw"
            
            print(xorOWin)
        }
        }
    }
    //return xorOWin
    }
    
    func thereIsAWinner (name: Bool) -> String {
        var winnerLabel = ""
        if name == true {
        winnerLabel = xorOWin
        } else {
            winnerLabel = xorOWin
        }
        //print(name)
       // gameIsActive = false
        return winnerLabel
    }
    func newGame() {
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = false
    }
}
