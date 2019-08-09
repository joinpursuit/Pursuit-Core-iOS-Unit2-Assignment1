//
//  model.swift
//  TicTacToeDev
//
//  Created by Jack Wong on 8/1/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//
import UIKit
import Foundation

//let row1: Set<Int> = [0,1,2]
//let row2: Set<Int> = [3,4,5]
//let row3: Set<Int> = [6,7,8]
//let row4: Set<Int> = [0,3,6]
//let row5: Set<Int> = [1,4,7]
//let row6: Set<Int> = [2,5,8]
//let row7: Set<Int> = [0,4,8]
//let row8: Set<Int> = [2,4,6]

//Row Combos
let row1: Set<Int> = [1,2,3]
let row2: Set<Int> = [4,5,6]
let row3: Set<Int> = [7,8,9]

//Column Combos
let row4: Set<Int> = [1,4,7]
let row5: Set<Int> = [2,5,8]
let row6: Set<Int> = [3,6,9]

//Diagonal Combos
let row7: Set<Int> = [1,5,9]
let row8: Set<Int> = [3,5,7]

let allPossibleWins = [row1,row2,row3,row4,row5,row6,row7,row8]

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


