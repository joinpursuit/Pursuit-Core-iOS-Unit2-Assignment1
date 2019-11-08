//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    
    //instance vars
    var board:[[String]]
    var previousPick = String()
    var rWin:Int?, cWin:Int?
    var typeWin:String?
    var player:String
    
    //initializers
    init(board: [[String]], rWin:Int?, cWin:Int?, typeWin:String?, player: String) {
        self.board = board
        self.rWin = rWin
        self.cWin = cWin
        self.typeWin = typeWin
        self.player = player
    }
    
    //methods
    func switchPlayer(player1: String){
         self.player = player1
        if player == "X" {
            player = "O"
        } else  {
            player = "X"
        }
    }
    
    //Checks for winning conditions.
    func checkForWin(player: String) -> Bool{
        for (index, rowValues) in board.enumerated(){
            //Checking for 3 horizontal (row) markers.
            if(board[index][0] == player && board[index][1] == player && board[index][2] == player) {
                rWin = index
                typeWin = "row"
                return true
            }
            
            //Checking for 3 vertical (column) markers.
            if(board[0][index] == player && board[1][index] == player && board[2][index] == player) {
                cWin = index;
                typeWin = "col";
                return true
            }
            
            //Checking for 2 diagonal markers.
            if(board[0][0] == player && board[1][1] == player && board[2][2] == player) {
                typeWin = "d1"
                return true
            }
            if(board[2][0] == player && board[1][1] == player && board[0][2] == player) {
                typeWin = "d2"
                return true
            }
        }
        return false
    }
    
    //Cycles through an array meant to present game board.
    //Board is not filled if there are any null instances.
    func checkBoardFilled() -> Bool{
        
        if self.board.contains(where: { (row) -> Bool in
            if row.contains("_"){
                return true
            } else {
                return false
            }
        }){
            return false
        } else {
            return true
        }
    }
    
    //Text shown for a tie, when the board is filled up.
    func boardFilled(uiLabel: UILabel) {
        //No need to disable buttons since they will be all pressed
        //and disabled already.
        uiLabel.text = "Game over! No more available cells on game board.\n It's a tie!"
    }
    
    //Once a win is detected, game board is disabled.
    func winDetected(player: String, arrButtons: [GameButton], uiLabel: UILabel){
        for button in arrButtons{
            button.isEnabled = false
        }
        uiLabel.text = "Player \(player) won! Game over!"
    }
    
    //Method to print game board to console after each move.
    //Was used to test if 'X' and 'O' were registering correctly in array.
    func printBoard() {
        for (index, row) in board.enumerated(){
            print(row)
        }
    }
    
    func resetBoard(){
        self.board = [[String]](repeating: [String](repeating: "_", count: 3), count: 3)
    }
    
}
