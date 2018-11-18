//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

enum outputOptions {
    case x
    case o
    case tie 
}

enum checkForWin {
    case player1Win
    case player2win
    case noOneWins
}

class gameBrain {
    
    var gameSquares =  [[outputOptions]](repeating: [outputOptions](repeating: .tie, count: 3), count: 3)
    
    var playerTurn = Turns.player1

enum Turns: String, CaseIterable {
 case player1
 case player2
    
    func image() -> UIImage {
        var imageButton: UIImage!
        switch self {
        case .player1:
            imageButton = UIImage(named:"XImage")
        default:
            imageButton = UIImage(named: "OImage")
            }
        return imageButton
}
   mutating func switchPlayers() {
        switch self {
        case .player1:
            self = .player2
        case .player2:
            self = .player1
        }
    }
 }
    func gameSetUp(row: Int, col: Int) {
        let outputs: outputOptions
        switch playerTurn {
        case .player1:
            outputs = .x
        case .player2:
            outputs = .o
        }
        gameSquares[row][col] = outputs
        
        playerTurn.switchPlayers()
    
    }
    func winningConditions() -> checkForWin {
    
        for row in gameSquares {
            if row == [.x, .x, .x] {
                return .player1Win
            } else if row == [.o,.o,.o] {
                return .player2win
            }
        }
        
        for columnIndex in 0..<gameSquares[0].count {
            var column = [outputOptions]()
            for rowIndex in 0..<gameSquares.count {
                column.append(gameSquares[rowIndex][columnIndex])
                if column == [.x,.x,.x] {
                    return .player1Win
                } else {
                    if column == [.o,.o,.o] {
                    return .player2win
                }
            }
        }
        
        var across1 = [outputOptions]()
        for i in 0..<gameSquares.count {
            across1.append(gameSquares[i][i])
        }
        if across1 == [.x,.x,.x] {
            return .player1Win
        } else {
            if across1 == [.o, .o, .o] {
                return .player2win

            }
        }
        
        var across2 = [outputOptions]()
        for i in 0..<gameSquares.count {
             across2.append(gameSquares[i][gameSquares.count - 1 - i])
        }
        if across2 == [.x,.x,.x] {
            return .player1Win
        } else {
            if across2 == [.o, .o, .o] {
                return .player2win
                
            }
        }
        
    }
    return .noOneWins
}
}
