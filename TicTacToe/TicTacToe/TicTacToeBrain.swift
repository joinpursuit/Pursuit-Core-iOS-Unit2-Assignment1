//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
  

    
  
    var gameboard : [[String]] = [["-", "-", "-"],
                                  ["-", "-", "-"],
                                  ["-", "-", "-"]]
    
    
    
    func updateBoard(player: Player, row: Int, column: Int){
        switch player {
        case .player1:
            gameboard[row][column] = "O"
        case .player2:
            gameboard[row][column] = "X"
        }
    }
    
    
    func checkWin() -> gameState {
    //horizontal
        for row in gameboard {
            if row == ["O", "O", "O"] {
                return .player1wins
                
            }else{
                if row == ["X", "X", "X"] {
                    return .player2wins
                }
            }
        }
        
        //vertical
        if gameboard[0][0] == "O" && gameboard[1][0] == "O" && gameboard[2][0] == "O" {
            return .player1wins
        } else if gameboard[0][1] == "O" && gameboard [1][1] == "O" && gameboard [2][1] == "O" {
            return .player1wins
        } else if gameboard [0][2] == "O" && gameboard [1][2] == "O" && gameboard [2][2] == "O" {
            return .player1wins
        }
       else if gameboard[0][0] == "X" && gameboard[1][0] == "X" && gameboard[2][0] == "X" {
            return .player2wins
        } else if gameboard[0][1] == "X" && gameboard [1][1] == "X" && gameboard [2][1] == "X" {
            return .player2wins
        } else if gameboard [0][2] == "X" && gameboard [1][2] == "X" && gameboard [2][2] == "X" {
            return .player2wins
        }
        
        //diagonal
        
        if gameboard [0][0] == "O" && gameboard [1][1] == "O" && gameboard [2][2] == "O" {
            return .player1wins
        }else if gameboard [0][2] == "O" && gameboard [1][1] == "O" && gameboard [2][0] == "O" {
            return .player1wins
        }
        if gameboard [0][0] == "X" && gameboard [1][1] == "X" && gameboard [2][2] == "X" {
            return .player2wins
        } else if gameboard [0][2] == "X" && gameboard [1][1] == "X" && gameboard [2][0] == "X" {
            return .player2wins
        }
        
        return .ongoing
    }
    
    
    func resetModel (){
        gameboard =  [["-", "-", "-"],
        ["-", "-", "-"],
        ["-", "-", "-"]]
        
    }
   
    //Make function that resets the board
    
}


