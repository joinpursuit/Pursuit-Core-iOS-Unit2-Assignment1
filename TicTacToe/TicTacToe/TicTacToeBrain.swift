//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

enum Image: String {
    case xMark = "xMark"
    case circle = "circle"
}

class TicTacToeBrain {
    
    var xMark = Image.xMark.rawValue
    var circle = Image.circle.rawValue
    
    public var playerImage: UIImage!
    public var playerMessage = " "
    public var playerOneTurn = true
    
    public func play(move: (row: Int, col: Int)) {
        if playerOneTurn {
            playerOneTurn = false
            self.playerImage = UIImage(named: xMark)
        } else {
            playerOneTurn = true
            self.playerImage = UIImage(named: circle)
        }
        self.playerMessage = playerOneTurn ? "Player One you are on" : "Player Two you are on"
    }
    
    
    
    public var winMatrix: [[Int]] = [[0,0,0],[0,0,0],[0,0,0]]
    
    
    
    private var indexToAccessArray = 0
    private var indexToAccessElement = 0
    private let  xForPlayerOne = 4
    private let oForPlayerTwo = 1
    
    
    func keepTracKInWinningarray (ticToeIndex: (row:Int, col:Int)){
        indexToAccessArray = ticToeIndex.row
        indexToAccessElement = ticToeIndex.col
        
        if playerOneTurn{
            winMatrix[indexToAccessArray][indexToAccessElement] = xForPlayerOne
        } else{
            winMatrix[indexToAccessArray][indexToAccessElement] = oForPlayerTwo
        }
    }
    
    
    public var playerOneWins = false
    public var playerTwoWins = false
    private var draw = false
    public var gameOver = false
    
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
            if winningCombinations[array].reduce(0, +) == 12 {
                playerTwoWins = true
                playerMessage = "player Two wins!"
                gameOver = true
                break
            } else if winningCombinations[array].reduce(0, +) == 3 {
                playerOneWins = true
                playerMessage = "Player One wins!"
                gameOver = true
                break
            }else if winMatrix.joined().reduce(0, +) == 21 && winningCombinations[array].reduce(0, +) == 3 {
                playerOneWins = true
                playerMessage = "Player One wins!"
                gameOver = true
            } else if winMatrix.joined().reduce(0, +) == 21 {
                draw = true
                playerMessage = "No winners among you..."
                gameOver = true
                
            }
        }
        return (playerMessage)
    }
    func resetBoard (reset: Bool){
        if reset {
            winMatrix = [
                [0,0,0],
                [0,0,0],
                [0,0,0]]
            gameOver = false
            playerOneTurn = true
        }
    }
    
}

