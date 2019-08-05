//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Sunni Tang on 08/1/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


class TicTacToeBrain {
    var gameBoard: [Tile] = Array.init(repeating: .empty, count: 9)
    var playerOneCounter = 0
    var playerTwoCounter = 0
    var currentPlayer = Player.playerOne

    var currentTile: Tile = .empty
    
    func updateBoard(tag: Int) {
        switch currentTile {
            case .o:
                break
            case .x:
                break
            case .empty:
                if currentPlayer == Player.playerOne {
                   gameBoard[tag] = .o
                    currentPlayer = .playerTwo
                } else if currentPlayer == Player.playerTwo {
                   gameBoard[tag] = .x
                    currentPlayer = .playerOne
            }
        }
        print (gameBoard)
    }
    
    
    func playerOneWins() -> Bool {
        playerOneCounter += 1
        return true
    }
    
    func playerTwoWins() -> Bool {
        playerTwoCounter += 1
        return true
    }
    
    //Update below to reflect new array of strings rather than matriu
    func checkForWin() {
        let row1: [Tile] = [gameBoard[0], gameBoard[1], gameBoard[2]]
        let row2: [Tile] = [gameBoard[3], gameBoard[4], gameBoard[5]]
        let row3: [Tile] = [gameBoard[6], gameBoard[7], gameBoard[8]]
        let col1: [Tile] = [gameBoard[0], gameBoard[3], gameBoard[6]]
        let col2: [Tile] = [gameBoard[1], gameBoard[4], gameBoard[7]]
        let col3: [Tile] = [gameBoard[2], gameBoard[5], gameBoard[8]]
        let dia1: [Tile] = [gameBoard[0], gameBoard[4], gameBoard[8]]
        let dia2: [Tile] = [gameBoard[6], gameBoard[4], gameBoard[2]]
        
        //horizontal wins
        if row1 == [Tile.o, Tile.o, Tile.o] || row2 == [Tile.o, Tile.o, Tile.o] || row3 == [Tile.o, Tile.o, Tile.o] {
            playerOneWins()
        } else if row1 == [Tile.x, Tile.x, Tile.x] || row2 == [Tile.x, Tile.x, Tile.x] || row3 == [Tile.x, Tile.x, Tile.x] {
            playerTwoWins()
        }
        
        //vertical wins
        if col1 == [Tile.o, Tile.o, Tile.o] || col2 == [Tile.o, Tile.o, Tile.o] || col3 == [Tile.o, Tile.o, Tile.o] {
            playerOneWins()
        } else if col1 == [Tile.x, Tile.x, Tile.x] || col2 == [Tile.x, Tile.x, Tile.x] || col3 == [Tile.x, Tile.x, Tile.x] {
            playerTwoWins()
        }
        
        //diagonal wins
        if dia1 == [Tile.o, Tile.o, Tile.o] || dia2 == [Tile.o, Tile.o, Tile.o] {
            playerOneWins()
        } else if dia1 == [Tile.x, Tile.x, Tile.x] || dia2 == [Tile.x, Tile.x, Tile.x] {
            playerTwoWins()
        }
        
    }

    
}






// Model
// Matrix that controls state of game (update based on user input) - var
// 1. Player switch (case?) -> Player one (assigns o), Player 2 (assigns x)
// mutating func to assign change in matrix,
// 3. Func for all winning combos (8 Combos), check for win condition. where tag.X == tag.Y == tag.Z.


// Controller
// 1a. Depending on player, change label
// 1b. Depending on player, change button image when pressed. Disable buttons


// View
// 1a. Sees whose turn based on player (label)
// 1b. Press button, image based on player

