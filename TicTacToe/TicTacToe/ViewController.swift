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
    @IBOutlet weak var botLeft: GameButton!
    @IBOutlet weak var bottomMiddle: GameButton!
    @IBOutlet weak var bottomRIght: GameButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    

    var playerOne = true
    var countColX = [Int]()
    var countRowX = [Int]()
    var countColO = [Int]()
    var countRowO = [Int]()
    
    

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
            topLeft.isEnabled = false
            topMiddle.isEnabled = false
            topRight.isEnabled = false
            middleLeft.isEnabled = false
            middleMiddle.isEnabled = false
            middleRight.isEnabled = false
            botLeft.isEnabled = false
            bottomMiddle.isEnabled = false
            bottomRIght.isEnabled = false
        }
        if playerOne {
        turnLabel.text = "Player one wins!"
        } else {
            turnLabel.text = "Player two wins!"
        }
    }

    @IBAction func allButtons(_ sender: GameButton) {
//        let row = sender.row
//        let col = sender.col
        let sender = sender
        TicTacToeBrain.assignXO(player: playerOne, sender, text: turnLabel)
        counter(sender)
//        TicTacToeBrain.checkWinnerVertHor(player: playerOne, sender, countColX: countColX, countRowX: countRowX, countColO: countColO, countRowO: countRowO)
        gameOver(winner: TicTacToeBrain.checkWinnerVertHor(player: playerOne, sender, countColX: countColX, countRowX: countRowX, countColO: countColO, countRowO: countRowO))
        TicTacToeBrain.checkWinnerDiag()
        playerOne = !playerOne
        

        
    }

    @IBAction func newGame(_ sender: UIButton) {
        topLeft.isEnabled = true
        topMiddle.isEnabled = true
        topRight.isEnabled = true
        middleLeft.isEnabled = true
        middleMiddle.isEnabled = true
        middleRight.isEnabled = true
        botLeft.isEnabled = true
        bottomMiddle.isEnabled = true
        bottomRIght.isEnabled = true
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
        botLeft.setImage(nil, for: .normal)
        bottomMiddle.setImage(nil, for: .normal)
        bottomRIght.setImage(nil, for: .normal)
        playerOne = true
        
    }
}

