//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//
import Foundation
struct TicTacToeBrain {
    var counter = 0
    var player = "X"
    var playerNumber = "Player One"
    var playerBoard = [["","",""],
                       ["","",""],
                       ["","",""]]
    func checkWinnerRow () -> Bool{
        
        for row in playerBoard{
            if row == [self.player, self.player, self.player] {
                return true
                
            }
        }
        return false
    }
    func checkWinnerDiagonal ()-> Bool {
        if playerBoard[0][0] == self.player &&  playerBoard[1][1] == self.player && playerBoard[2][2] == self.player{
            return true
        }
            
        else if playerBoard[0][2] == self.player &&  playerBoard[1][1] == self.player && playerBoard[2][0] == self.player{
            return true
            
        }
        
        return false
    }
    
    
    func checkWinnerCol ()-> Bool {
        if playerBoard[0][0] == self.player &&  playerBoard[1][0] == self.player && playerBoard[2][0] == self.player {return true
        }
            
        else if playerBoard[0][1] == self.player &&  playerBoard[1][1] == self.player && playerBoard[2][1] == self.player{return true
        }
            
        else if playerBoard[0][2] == self.player &&  playerBoard[1][2] == self.player && playerBoard[2][2] == self.player{return true
        }
        return false}
    mutating func updateArray (col: Int, row: Int){
        playerBoard[row][col] = player
    }
    mutating func updatePlayer (){
        counter += 1
        if counter % 2 == 0 {
            self.player = "O"
            self.playerNumber = "Player Two"
        } else {
            self.player = "X"
            self.playerNumber = "Player One"
        }
    }
}
