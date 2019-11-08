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
    
    
    func winRow() -> String {
        for arr in boardMatrix {
            if arr == winningX {
                return "Player 1 wins"
            } else if arr == winningO {
                return "Player 2 wins"
            }
        }
        return ""
    }
    
    
    func winColumn() -> String {
        var compareCol0 = [String]()
        var compareCol1 = [String]()
        var compareCol2 = [String]()
        
        for arr in boardMatrix {
            //comparing colums
            for (index, str) in arr.enumerated() {
                switch index {
                case 0 :
                    compareCol0.append(str)
                    if compareCol0 == winningX {
                        return "Player 1 wins"
                    } else if compareCol0 == winningO {
                        return "Player 2 wins"
                    } else {
                    }
                case 1 :
                    compareCol1.append(str)
                    if compareCol1 == winningX {
                        return "Player 1 wins"
                    } else if compareCol1 == winningO {
                        return "Player 2 wins"
                    } else {
                    }
                case 2 :
                    compareCol2.append(str)
                    if compareCol2 == winningX {
                        return "Player 1 wins"
                    } else if compareCol2 == winningO {
                        return "Player 2 wins"
                    } else {
                    }
                    print("Col 2 updated = \(compareCol2)")
                default :
                    print("Player")
                }
            }
            
        }
        return ""
    }
    
    
    func diagnolWin() -> String {
        var diagnol1 = [String]()
        var diagnol2 = [String]()
        
        for (index , arr) in boardMatrix.enumerated() {
            for (point , str) in arr.enumerated() {
                if index == point {
                    diagnol1.append(str)
                    if diagnol1 == winningX {
                        return "Player 1 wins"
                    } else if diagnol1 == winningO {
                        return "Player 2 wins"
                    }
                    
                } 
            }
        }
        return ""
    }
    
    
    
    
}

