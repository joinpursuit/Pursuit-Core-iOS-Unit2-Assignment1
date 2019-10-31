//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class TicTacToeBrain {
    static var xTurn: Bool = true
    static var scoreOne = 0
    static var scoreTwo = 0
    static var movesMade = 0
    
    static func xOrO (_ button: GameButton) {
        if xTurn {
            button.setBackgroundImage(UIImage(systemName: "xmark"), for: .disabled)
        } else {
            button.setBackgroundImage(UIImage(systemName: "circle"), for: .disabled)
        }
    }
    
    static func playerTurn(_ label: UILabel) {
        label.text = xTurn ? "Player 1's turn" : "Player 2's turn"
    }
    
    static func winCheck(_ xOButtons: [GameButton],_ displayLabel: UILabel) {
        var row1 = 0
        var row2 = 0
        var row3 = 0
        var col1 = 0
        var col2 = 0
        var col3 = 0
        var diag1 = 0
        var diag2 = 0
        
        for button in xOButtons {
            checkButton(button, 0, &row1)
            checkButton(button, 1, &row2)
            checkButton(button, 2, &row3)
            checkButton2(button, 0, &col1)
            checkButton2(button, 1, &col2)
            checkButton2(button, 2, &col3)
        }
        
        for button in xOButtons {
            if button.col == button.row {
                if button.backgroundImage(for: .disabled) == UIImage(systemName: "xmark") {
                    diag1 += 1
                    if button.rowCol == (1, 1) {
                        diag2 += 1
                    }
                } else if button.backgroundImage(for: .disabled) == UIImage(systemName: "circle") {
                    diag1 -= 1
                    if button.rowCol == (1, 1) {
                        diag2 -= 1
                    }                }
            } else if button.rowCol == (2, 0) || button.rowCol == (0,2) {
                if button.backgroundImage(for: .disabled) == UIImage(systemName: "xmark") {
                    diag2 += 1
                } else if button.backgroundImage(for: .disabled) == UIImage(systemName: "circle") {
                    diag2 -= 1
                }
            }
        }
        
        if row1 == 3 || row2 == 3 || row3 == 3 || col1 == 3 || col2 == 3 || col3 == 3 || diag1 == 3 || diag2 == 3 {
            for button in xOButtons {
                button.isEnabled = false
            }
            displayLabel.text = "Player 1 Won!"
            scoreOne += 1
        } else if row1 == -3 || row2 == -3 || row3 == -3 || col1 == -3 || col2 == -3 || col3 == -3 || diag1 == -3 || diag2 == -3 {
            for button in xOButtons {
                button.isEnabled = false
            }
            displayLabel.text = "Player 2 Won!"
            scoreTwo += 1
        }
    }
    static func checkButton(_ button: GameButton, _ num: Int,_ desig:inout Int) {
        if button.row == num {
            if button.backgroundImage(for: .disabled) == UIImage(systemName: "xmark") {
                desig += 1
            } else if button.backgroundImage(for: .disabled) == UIImage(systemName: "circle") {
                desig -= 1
            }
        }
    }
    static func checkButton2(_ button: GameButton, _ num: Int,_ desig:inout Int) {
        if button.col == num {
            if button.backgroundImage(for: .disabled) == UIImage(systemName: "xmark") {
                desig += 1
            } else if button.backgroundImage(for: .disabled) == UIImage(systemName: "circle") {
                desig -= 1
            }
        }
    }
}
