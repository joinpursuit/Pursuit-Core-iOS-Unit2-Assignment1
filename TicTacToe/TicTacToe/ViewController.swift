//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayMessage: UILabel!
    @IBOutlet weak var startGameMessage: UIButton!
    @IBOutlet var buttons: [GameButton]!
    
    var xoArrofArr: [[GameButton]] = [[],[]]
    var counter: Int = 0
    var winner: String? = ""
    
    override func viewDidLoad() {
    super.viewDidLoad()
  }
    
    func disableAll() {
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    func enableAll() {
        for button in buttons {
            button.isEnabled = true
        }
    }

    @IBAction func pressStartGame(_ sender: UIButton) {
        for button in buttons {
            button.setTitle("", for: .normal)
        }
        displayMessage.text = "Player 1 (X), your turn."
        counter = 0
        enableAll()
        xoArrofArr = [[],[]]
    }
    
    func gameOver() {
        disableAll()
        if let safeWinner = winner {
            displayMessage.text = "Game Over. \nWinner is \(safeWinner)"
        } else {
            displayMessage.text = "Game Over.\nIt's a tie."
        }
    }
    
    @IBAction func startGame(_ sender: GameButton) {
        var buttonsPressed: Int = 0
        startGameMessage.setTitle("Restart", for: .normal)
        if counter % 2 == 0 {
            if sender.isEnabled {
            counter += 1
            sender.setTitle(UserPiece.x.symbol, for: .normal)
            sender.setTitleColor(UserPiece.x.color, for: .normal)
            sender.isEnabled = false
            xoArrofArr[0].append(sender)
            displayMessage.text = "Player 2 (O), your turn."
            }
        } else {
            if sender.isEnabled {
            counter += 1
            sender.setTitle(UserPiece.o.symbol, for: .normal)
            sender.setTitleColor(UserPiece.o.color, for: .normal)
            sender.isEnabled = false
            xoArrofArr[1].append(sender)
            displayMessage.text = "Player 1 (X), your turn."
            }
        }
        
    if xoArrofArr[0].count >= 3 {
        for arr in xoArrofArr {
            for button1 in arr[0..<arr.count-2] {
                for button2 in arr[0..<arr.count-1] {
                    for button3 in arr[0..<arr.count] {
                        if ((button2.row == button1.row && button3.row == button1.row) || (button2.col == button1.col && button3.col == button1.col) || (button1.row == button1.col && button2.row == button2.col && button3.row == button3.col) || ((button1.row + button1.col == 2) && (button2.row + button2.col == 2) &&  (button3.row + button3.col == 2))) && button1 != button2 && button2 != button3 && button1 != button3 {
                            winner = counter % 2 == 0 ? UserPiece.o.player : UserPiece.x.player
                            gameOver()
                            }
                        }
                    }
                }
            }
        }
        
        for button in buttons {
            if button.isEnabled == false {
                buttonsPressed += 1
            }
        }
        if buttonsPressed == 10 {
            winner = nil
            gameOver()
        }
    }
}
