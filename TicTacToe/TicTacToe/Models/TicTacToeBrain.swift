//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

struct TicTacToeBrain {
    let player1 = "x"
    let player2 = "o"
    let winCombos = [[1,4,7],
                    [2,5,8],
                    [3,6,9],
                    [1,2,3],
                    [4,5,6],
                    [7,8,9],
                    [1,5,9],
                    [3,5,7]]
    
    var player1Moves: [[Int]] = [[],[],[],[],[],[],[],[]]
    var player2Moves: [[Int]] = [[],[],[],[],[],[],[],[]]
    
    mutating func addPlayerMoveToMovesBank(tag: Int, playerSymbol: String) {
        if playerSymbol == "x" {
            for (index, combo) in winCombos.enumerated(){
                if combo.contains(tag) {
                    player1Moves[index].append(tag)
                    print(player1Moves)
                }
            }
        } else if playerSymbol == "o" {
            for (index, combo) in winCombos.enumerated(){
                if combo.contains(tag) {
                    player2Moves[index].append(tag)
                    print(player2Moves)
                }
            }
        }
    }
    
    func checkForWinningCombos(playerSymbol: String) -> Bool {
        if playerSymbol == "x" {
            for combo in winCombos{
                if player1Moves.contains(combo){
                    return true
                }
            }
        } else if playerSymbol == "o" {
            for combo in winCombos{
                if player2Moves.contains(combo){
                    return true
                }
            }
        }
        return false
    }
    
    
}
