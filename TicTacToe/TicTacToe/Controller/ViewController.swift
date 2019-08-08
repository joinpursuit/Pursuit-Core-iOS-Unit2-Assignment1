//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var ButtonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var PlayerTurnMessageLabel: UILabel!
    @IBOutlet weak var bottonImage: UIImageView!
    
    var game = TicTacToeBrain()
    
    
    @IBAction func gameController(_ sender: UIButton) {
        sender.setTitle(game.currentPlayer, for: .normal)
        game.board[sender.tag-1] = game.currentPlayer
        playerTurnMessage()
        
        if  game.winner {
            PlayerTurnMessageLabel.text = "winner is \(game.currentPlayer)"
            disableButtons()
        } else if game.boardIsFull {
            PlayerTurnMessageLabel.text = "Cat's game"
            disableButtons()
        }
        game.turn += 1
        sender.isEnabled = false
    }

    
    @IBAction func endGameButton(_ sender: UIButton) {
        restartGame()
    }
    
   
    private func enableButtons() -> Void {
        buttonOne.isEnabled = true
        ButtonTwo.isEnabled = true
        buttonThree.isEnabled = true
        buttonFour.isEnabled = true
        buttonFive.isEnabled = true
        buttonSix.isEnabled = true
        buttonSeven.isEnabled = true
        buttonEight.isEnabled = true
        buttonNine.isEnabled = true
    }
    
    private func disableButtons() -> Void {
        buttonOne.isEnabled = false
        ButtonTwo.isEnabled = false
        buttonThree.isEnabled = false
        buttonFour.isEnabled = false
        buttonFive.isEnabled = false
        buttonSix.isEnabled = false
        buttonSeven.isEnabled = false
        buttonEight.isEnabled = false
        buttonNine.isEnabled = false
    }
    
    
    private func resetButtons() -> Void {
        buttonOne.setTitle("", for: .normal)
        ButtonTwo.setTitle("", for: .normal)
        buttonThree.setTitle("", for: .normal)
        buttonFour.setTitle("", for: .normal)
        buttonFive.setTitle("", for: .normal)
        buttonSix.setTitle("", for: .normal)
        buttonSeven.setTitle("", for: .normal)
        buttonEight.setTitle("", for: .normal)
        buttonNine.setTitle("", for: .normal)
    }
    
    private func restartGame() -> Void {
        resetButtons()
        enableButtons()
        game.start()
        PlayerTurnMessageLabel.text = "Player One's Turn"
    }

    
    private func playerTurnMessage() -> Void {
        if game.turn % 2 == 0 {
            PlayerTurnMessageLabel.text = "Player Two's Turn"
        } else {
            PlayerTurnMessageLabel.text = "Player One's Turn"
        }
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartGame()
    // Do any additional setup after loading the view, typically from a nib.
  }
}

