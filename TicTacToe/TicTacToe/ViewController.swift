//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topLeft: GameButton!
    @IBOutlet weak var topMiddle: GameButton!
    @IBOutlet weak var topRight: GameButton!
    @IBOutlet weak var middleLeft: GameButton!
    @IBOutlet weak var middleMiddle: GameButton!
    @IBOutlet weak var middleRight: GameButton!
    @IBOutlet weak var bottomLeft: GameButton!
    @IBOutlet weak var bottomMiddle: GameButton!
    @IBOutlet weak var bottomRight: GameButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var playerOne = true
    var countColX = [Int]()
    var countRowX = [Int]()
    var countColO = [Int]()
    var countRowO = [Int]()
    var winX = 0
    var winO = 0

  override func viewDidLoad() {
    super.viewDidLoad()

  }
    func counter(_ sender: GameButton) {
        if playerOne {
            countColX.append(sender.col)
            countRowX.append(sender.row)
        } else {
            countColO.append(sender.col)
            countRowO.append(sender.row)
        }
    }
    func gameOver(winner: Bool) {
        if winner {
            if playerOne {
                winX += 1
                turnLabel.text = "Player one wins!"
                winnerLabel.text = "X wins: \(winX) & O wins: \(winO)"
                
            } else {
                winO += 1
                turnLabel.text = "Player two wins!"
                winnerLabel.text = "X wins: \(winX) & O wins: \(winO)"
            }
            topLeft.isEnabled = false
            topMiddle.isEnabled = false
            topRight.isEnabled = false
            middleLeft.isEnabled = false
            middleMiddle.isEnabled = false
            middleRight.isEnabled = false
            bottomLeft.isEnabled = false
            bottomMiddle.isEnabled = false
            bottomRight.isEnabled = false
        }
        
    }

    @IBAction func allButtons(_ sender: GameButton) {
//        let row = sender.row
//        let col = sender.col
        let sender = sender
        TicTacToeBrain.assignXO(player: playerOne, sender, text: turnLabel)
        counter(sender)
        gameOver(winner: TicTacToeBrain.checkWinnerVertHor(player: playerOne, sender, countColX: countColX, countRowX: countRowX, countColO: countColO, countRowO: countRowO))
        gameOver(winner: TicTacToeBrain.checkWinnerDiagX(topLeft: topLeft, topRight: topRight, middleMiddle: middleMiddle, bottomLeft: bottomLeft, bottomRight: bottomRight))
        gameOver(winner: TicTacToeBrain.checkWinnerDiagO(topLeft: topLeft, topRight: topRight, middleMiddle: middleMiddle, bottomLeft: bottomLeft, bottomRight: bottomRight))
        playerOne = !playerOne
        
    }

    @IBAction func newGame(_ sender: UIButton) {
        topLeft.isEnabled = true
        topMiddle.isEnabled = true
        topRight.isEnabled = true
        middleLeft.isEnabled = true
        middleMiddle.isEnabled = true
        middleRight.isEnabled = true
        bottomLeft.isEnabled = true
        bottomMiddle.isEnabled = true
        bottomRight.isEnabled = true
        topLeft.isUserInteractionEnabled = true
        topMiddle.isUserInteractionEnabled = true
        topRight.isUserInteractionEnabled = true
        middleLeft.isUserInteractionEnabled = true
        middleMiddle.isUserInteractionEnabled = true
        middleRight.isUserInteractionEnabled = true
        bottomLeft.isUserInteractionEnabled = true
        bottomMiddle.isUserInteractionEnabled = true
        bottomRight.isUserInteractionEnabled = true
        countColX = [Int]()
        countRowX = [Int]()
        countColO = [Int]()
        countRowO = [Int]()
        topLeft.setImage(nil, for: .normal)
        topMiddle.setImage(nil, for: .normal)
        topRight.setImage(nil, for: .normal)
        middleLeft.setImage(nil, for: .normal)
        middleMiddle.setImage(nil, for: .normal)
        middleRight.setImage(nil, for: .normal)
        bottomLeft.setImage(nil, for: .normal)
        bottomMiddle.setImage(nil, for: .normal)
        bottomRight.setImage(nil, for: .normal)
        playerOne = true
        turnLabel.text = "Player one's turn"

        
    }
}

