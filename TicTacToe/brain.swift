//
//  brain.swift
//  TicTacToe
//
//  Created by Kimball Yang on 8/8/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import Foundation

struct TicTacToe {
    
    var counter = 0
    
    var arrayOfGame =
        ["", "", ""
        ,"", "", ""
        ,"", "", ""]
    
    var currentPlayer = "X"
    
    mutating func updateValues(sender: Int) {
        if counter % 2 == 0 {
            print(sender)
            currentPlayer = "X"
        } else {
            currentPlayer = "O"
            print(sender)
        }
        arrayOfGame[sender] = currentPlayer
      
        counter += 1
    }
    
    func winCon() -> Bool {
        
        // checking first row
        if arrayOfGame[0] == currentPlayer && arrayOfGame[1] == currentPlayer && arrayOfGame[2] == currentPlayer {
            return true
        } else if
            //checking second row
            arrayOfGame[3] == currentPlayer && arrayOfGame[4] == currentPlayer && arrayOfGame[5] == currentPlayer {
                return true
            } else if
            // checking last row
        arrayOfGame[6] == currentPlayer && arrayOfGame[7] == currentPlayer && arrayOfGame[8] == currentPlayer {
                return true
            } else if
            // checking first column
        arrayOfGame[0] == currentPlayer && arrayOfGame[3] == currentPlayer && arrayOfGame[6] == currentPlayer {
                return true
        } else if
            // checking second column
        arrayOfGame[1] == currentPlayer && arrayOfGame[4] == currentPlayer && arrayOfGame[7] == currentPlayer {
                return true
        } else if
            // checking third column
        arrayOfGame[2] == currentPlayer && arrayOfGame[5] == currentPlayer && arrayOfGame[8] == currentPlayer {
        return true
    } else if
            // checking diagonal top left to bot right
        arrayOfGame[0] == currentPlayer && arrayOfGame[4] == currentPlayer && arrayOfGame[8] == currentPlayer {
        return true
        } else if
        // checking diagonal bot left to top right
        arrayOfGame[2] == currentPlayer && arrayOfGame[4] == currentPlayer && arrayOfGame[6] == currentPlayer {
            return true
        }
        
        return false
}
}
