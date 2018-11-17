//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


class TicTacToeBrain {
    
    
    
    public var playerImage: UIImage!
    public var playerMessage = " "
    public var playerOneTurn = true
    
    public func play(move: (row: Int, col: Int)) {
        print("row: \(move.row), col: \(move.col)")
        if playerOneTurn {
            playerOneTurn = false
            self.playerImage = UIImage(named: "xMark")
        } else {
            playerOneTurn = true
            self.playerImage = UIImage(named: "circle")
        }
        self.playerMessage = playerOneTurn ? "Player One you are on" : "Player Two you are on"
    }
    
    
    
    var winMatrix: [[Int]] = [[0,0,0],[0,0,0],[0,0,0]]
    
    
    
    var indexToAccessArray = 0
    var indexToAccessElement = 0
    let  xForPlayerOne = 4
    let oForPlayerTwo = 1
    func keepTracKInWinningarray (ticToeIndex: (row:Int, col:Int)){
        
        
        indexToAccessArray = ticToeIndex.row
        indexToAccessElement = ticToeIndex.col
        
        if playerOneTurn{
            winMatrix[indexToAccessArray][indexToAccessElement] = xForPlayerOne
        } else{
            winMatrix[indexToAccessArray][indexToAccessElement] = oForPlayerTwo
        }
        print(winMatrix)
    }
    
    
    
    
    var playerOneWins = false
    var playerTwoWins = false
    var draw = false
    var gameOver = false
    
    func whoWins (possibleWinningCombinations: [[Int]]) -> String{
        
        var winningCombinations = [
            //        horizontal = 3
            [winMatrix[0][0], winMatrix[0][1], winMatrix[0][2]],
            [winMatrix[1][0], winMatrix[1][1], winMatrix[1][2]],
            [winMatrix[2][0], winMatrix[2][1], winMatrix[2][2]],
            
            //        vertical = 12
            [winMatrix[0][0], winMatrix[1][0], winMatrix[2][0]],
            [winMatrix[0][1], winMatrix[1][1], winMatrix[2][1]],
            [winMatrix[0][2], winMatrix[1][2], winMatrix[2][2]],
            
            //        diagonal
            [winMatrix[0][0], winMatrix[1][1], winMatrix[2][2]],
            [winMatrix[0][2], winMatrix[1][1], winMatrix[2][0]]
            
        ]
        for array in 0 ..< winningCombinations.count{
            if winningCombinations[array].reduce(0, +) == 3 {
                playerOneWins = true
                playerMessage = "Player One wins!"
                gameOver = true
                print("player one wins")
            } else if winningCombinations[array].reduce(0, +) == 12 {
                playerTwoWins = true
                playerMessage = "player Two wins!"
                print("player two wins")
                gameOver = true
            }else if winMatrix.joined().reduce(0, +) == 21 {
                if winningCombinations[array].reduce(0, +) == 3 {
                    playerOneWins = true
                    playerMessage = "Player One wins!"
                    print("player one wins")
                    gameOver = true
                }
                if winningCombinations[array].reduce(0, +) == 12 {
                    playerTwoWins = true
                    playerMessage = "player Two wins!"
                    print("player two wins")
                    gameOver = true
                } else if winMatrix.joined().reduce(0, +) == 21 {
                    draw = true
                    playerMessage = "No winners among you..."
                    print("no one wins")
                    gameOver = true
                }
            }
        }
        return (playerMessage)
    }
}



//for i in 0 ..< possibleWinningCombinations.count {
//
//    for _ in 0 ..< possibleWinningCombinations[i].count{
//        print(winMatrix)
//    }
//
//}
