//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    
    //MARK: Helper Functions
    private func checkRows(_ matrix: [[GameButton]], _ str: String) ->  Bool{
        var win = true
        
        for i in 0..<matrix.count{
            win = true
            for j in 0..<matrix.count{
                    if matrix[i][j].titleLabel?.text != str{
                        win = false
                        break
                    }
            }
            if win {
                return true
            }
        }
        
        return win
    }
    
    private func checkColumns(_ matrix: [[GameButton]], _ str: String) -> Bool{
        var win = true
        
        for i in 0..<matrix.count{
            win = true
            for j in 0..<matrix.count{
               if matrix[j][i].titleLabel?.text != str{
                        win = false
                }
            }
            if win {
                return true
            }
        }
        
           
        return win
    }
    
    private func checkDiagnols(_ matrix: [[GameButton]], _ str: String) -> Bool{
        var win = false

            if matrix[0][0].titleLabel?.text == str && matrix[1][1].titleLabel?.text == str && matrix[2][2].titleLabel?.text == str{
                win = true
            }
        
        if matrix[0][2].titleLabel?.text == str && matrix[1][1].titleLabel?.text == str && matrix[2][0].titleLabel?.text == str{
            win = true
        }
        
        return win
    }
    
    //MARK: Methods of TicTacToeBrain
    
    func didSomeoneWinYet(_ matrix: [[GameButton]], _ str: String) -> Bool{
        var winConditionMet = false
        
        winConditionMet = checkRows(matrix, str)
        
        if winConditionMet{
            return true
            
        }
        
        winConditionMet = checkColumns(matrix, str)
        
        if winConditionMet {
            return true
            
        }
        
        winConditionMet = checkDiagnols(matrix, str)
        
        if winConditionMet {
            return true
            
        }
        
        return winConditionMet
    }
    
    func makeRandomMove(_ matrix: [[GameButton]], _ str: String){
        var validMove: Bool = false
        var tempTuple: (row:Int,col:Int) = (0,0)
        
        while !validMove && !noMovesLeft(matrix){
            tempTuple = (row: Int.random(in: 0...2), col: Int.random(in: 0...2))
            if matrix[tempTuple.row][tempTuple.col].isUserInteractionEnabled {
                validMove = true
                if str == "O"{
                    oh(matrix[tempTuple.row][tempTuple.col])
                } else if str == "X"{
                    exe(matrix[tempTuple.row][tempTuple.col])
                }
                
            }
        }
    }
    
    func noMovesLeft(_ matrix: [[GameButton]]) -> Bool{
        let noMoves = true
        
        for array in matrix{
            for element in array{
                if element.isUserInteractionEnabled == true{
                    return false
                }
            }
        }
        
        return noMoves
    }
    
    func startGame(_ matrix: [[GameButton]]){
        for array in matrix{
            for element in array{
            element.setTitle("", for: .normal)
            element.titleLabel?.text = ""
            element.isUserInteractionEnabled = true
            }
        }
    }
    
    func disable(_ matrix: [[GameButton]]){
        for array in matrix{
            for element in array{
                element.setTitle("", for: .normal)
                element.titleLabel?.text = ""
                element.isUserInteractionEnabled = false
            }
        }
    }
    
    func setRowsAndColumns(_ matrix: [[GameButton]]){
        for i in 0..<matrix.count{
            for j in 0..<matrix.count{
                matrix[i][j].setRowAndCol(row: i, col: j)
            }
        }
    }
    
    func exe(_ button: GameButton){
        button.setTitle("X", for: .normal)
        button.isUserInteractionEnabled = false
    }
    
    func oh(_ button: GameButton){
        button.setTitle("O", for: .normal)
        button.isUserInteractionEnabled = false
    }
    
    func switchTurn(_ x: Bool) -> Bool {
        return !x
    }
}
