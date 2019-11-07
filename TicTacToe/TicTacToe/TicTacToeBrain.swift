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
    var compareCol0: [String] = []
    var compareCol1 = [""]
    var compareCol2 = [""]
    
    
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
        
        for arr in boardMatrix {
            
            //comparing rows
            if arr == winningX {
                return "Player 1 wins"
            } else if arr == winningO {
                return "Player 2 wins"
            }
            
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
                        compareCol0.removeAll()
                    }
                    print(compareCol0)
                case 1 :
                    compareCol1.append(str)
                    if compareCol1 == winningX {
                        return "Player 1 wins"
                    } else if compareCol1 == winningO {
                        return "Player 2 wins"
                    } else {
                        compareCol1.removeAll()
                    }
                case 2 :
                    compareCol2.append(str)
                    if compareCol2 == winningX {
                        return "Player 1 wins"
                    } else if compareCol2 == winningO {
                        return "Player 2 wins"
                    } else {
                        compareCol2.removeAll()
                    }
                default :
                    return "No winners"
                }
                //                if index == 0 {
                //                    compareCol0.append(str)
                //                    if compareCol0 == winningX {
                //                        return "Player 1 wins"
                //                    } else if compareCol0 == winningO {
                //                        return "Player 2 wins"
                //                    } else {
                //                        compareCol0.removeAll()
                //                    }
                //                } else if index == 1 {
                //                    compareCol1.append(str)
                //                    if compareCol1 == winningX {
                //                        return "Player 1 wins"
                //                    } else if compareCol1 == winningO {
                //                        return "Player 2 wins"
                //                    } else {
                //                        compareCol1.removeAll()
                //                    }
                //                } else if index == 2 {
                //                    compareCol2.append(str)
                //                    if compareCol2 == winningX {
                //                        return "Player 1 wins"
                //                    } else if compareCol2 == winningO {
                //                        return "Player 2 wins"
                //                    } else {
                //                        compareCol2.removeAll()
                //                    }
                //                }
            }
            
        } 
        return ""
    }
    
    
    
    
    
}

