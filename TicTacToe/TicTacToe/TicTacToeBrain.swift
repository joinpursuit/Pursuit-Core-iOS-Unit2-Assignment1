//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

// this is where you should have your logic, win or loose, THIS IS THE MODEL

import UIKit

var blank = "_"  // if it doesn't have an x or o, this variable is a placeholder for our board
var xsymbol = "x"
var osymbol = "o"

class TicTacToeBrain {
  var player1 = false
  var player2 = false
  // represents our tic tac toe board, blanks are going to get replaced with x and o
  var player1wins = false
  var player2wins = false
  var turnTracker = 0   // keeps tracks of players turns 0 player 1 player 2 1
  var gameboard = [[blank,blank,blank],
                  [blank,blank,blank],
                  [blank,blank,blank]]
  
    func gameMove() { // keeps track of whose move it is, just a function that does something so empty (), no parameters and no return value
        turnTracker += 1  // we are adding 1 to our turnTracker
        if turnTracker % 2 == 1 {     // if its odd it would be player 1's turn
            player1 = true
            player2 = false
        } else {
        player1 = false
        player2 = true
        }
    }

    func gameResult() {
        //Horizontal
        for row in gameboard {
            if row == [xsymbol,xsymbol,xsymbol] {   // this is to check horizontally if the player gets x or o
                player1wins = true
                break
            } else if row == [osymbol, osymbol, osymbol] {
                player2wins = true
            break
        }
}
        //Vertical
            for columnIndex in 0..<gameboard[0].count {
                var column = [String]()                 // this is to append the stuff from other rows
                for rowIndex in 0..<gameboard.count {
                    column.append(gameboard[rowIndex][columnIndex])
                    if column == [xsymbol,xsymbol,xsymbol]{
                        player1wins = true
                        break
                    } else if column == [osymbol,osymbol,osymbol] {
                        player2wins = true
                        break
                }
        }
}
            //Diagonal 1
                var diagnol1 = [String]()
                for i in 0..<gameboard.count {
                    diagnol1.append(gameboard[i][i])
                    if diagnol1 == [xsymbol,xsymbol,xsymbol] {
                        player1wins = true
                        break
                    } else if diagnol1 == [osymbol,osymbol,osymbol] {
                    player2wins = true
                    break
                    }
    
    //Diagnol 2
                var diagnol2 = [String]()
               for i in 0..<gameboard.count {
                    diagnol2.append(gameboard[i][gameboard.count - 1 - i])
                 if diagnol2 == [xsymbol,xsymbol,xsymbol] {
                      player1wins = true
                      break
                   } else if diagnol2 == [osymbol,osymbol,osymbol] {
                   player2wins = true
                   break
                   }
                }
            }
        }
}
