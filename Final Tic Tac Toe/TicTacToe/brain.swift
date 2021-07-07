//
//  brain.swift
//  TicTacToe
//
//  Created by Jack Wong on 8/8/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//
import UIKit
import Foundation

//Row Combos
let row1: Set<Int> = [1,2,3]
let row2: Set<Int> = [4,5,6]
let row3: Set<Int> = [7,8,9]

//Column Combos
let col1: Set<Int> = [1,4,7]
let col2: Set<Int> = [2,5,8]
let col3: Set<Int> = [3,6,9]

//Diagonal Combos
let diag1: Set<Int> = [1,5,9]
let diag2: Set<Int> = [3,5,7]

let allPossibleWins = [row1,row2,row3,col1,col2,col3,diag1,diag2]

struct player {
    var playerName: String = "Player One"
    var winCount: Int = 0
    var playerMark = String() //should be either X or O
    var allPlayerMoves = Set<Int>()
    var winningCombo = Set<Int>()
    
    mutating func playerMove(_ senderTag: Int)->String{
        allPlayerMoves.insert(senderTag)
        return playerMark
    }
    
    mutating func clearMoves(){
        allPlayerMoves.removeAll()
    }
    
    mutating func didPlayerWin()->Bool{
        for set in allPossibleWins{
            if set.isSubset(of: allPlayerMoves){
                winningCombo = set
                winCount += 1
                return true}
        }
        return false
    }
    
    init(playerName: String, playerMark: String) {
        self.playerName = playerName
        self.playerMark = playerMark
    }
}


