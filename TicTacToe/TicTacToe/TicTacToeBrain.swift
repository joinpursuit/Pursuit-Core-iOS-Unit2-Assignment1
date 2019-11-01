//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    var winingCombinations = [[1, 2, 3],
                              [4, 5, 6],
                              [7, 8, 9],
                              [1, 4, 7],
                              [2, 5, 8],
                              [3, 6, 9],
                              [1, 5, 9],
                              [3, 5, 7]]
    var buttonX: Set<Int> = []
    var buttonO: Set<Int> = []
    var score1 = 0
    var score2 = 0
    
    func winningPatern(_ xoButtons: [UIButton], _ gameStatus: UILabel, _ player1: UILabel, _ player2: UILabel) {
        for winingCombination in winingCombinations {
            if buttonX.isSuperset(of: winingCombination) {
                gameStatus.text = "Player1 Wins!"
                for button in xoButtons {
                    button.isEnabled = false
                }
                score1 += 1
                player1.text = "Player1 Score: \(score1)"
                break
            } else if buttonO.isSuperset(of: winingCombination) {
                gameStatus.text = "Player2 Wins!"
                for button in xoButtons {
                    button.isEnabled = false
                }
                score2 += 1
                player2.text = "Player1 Score: \(score2)"
                break
            } else if buttonX.count >= 5 {
                gameStatus.text = "Draw"
                break
            }
        }
    }
    
    func resetGame(_ xoButtons: [UIButton]) {
        for button in xoButtons {
            button.setBackgroundImage(nil, for: .normal)
            button.isEnabled = true
        }
        buttonX.removeAll()
        buttonO.removeAll()
    }
}
