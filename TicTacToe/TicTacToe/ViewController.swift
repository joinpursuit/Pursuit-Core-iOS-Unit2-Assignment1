//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var turnPlayer: UILabel!
    @IBOutlet var gameButtons: [GameButton]!
    @IBOutlet weak var resetGame: UIButton!
    @IBOutlet weak var winMessage: UILabel!
    @IBOutlet weak var scores: UILabel!
    
    var gameStatus = TicTacToeBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GameButton.buttonState(gameButtons, false)
        turnPlayer.text = "Welcome! Ready?"
        winMessage.text = ""
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        GameButton.buttonState(gameButtons, true)
        GameButton.resetButtonText(gameButtons)
        gameStatus.alternateTurn()
        turnPlayer.text = gameStatus.displayTurnPlayer()
        winMessage.text = ""
        TicTacToeBrain.gameBoard = [["","",""],["","",""],["","",""]]
    }
    
    @IBAction func choice(_ sender: GameButton) {
        sender.setTitle(gameStatus.markChoice(), for: UIControl.State.normal)
        sender.isEnabled = false
        updateGameBoard(sender)
        checkGameStatus()
    }
    
    func updateGameBoard(_ sender: GameButton) {
        TicTacToeBrain.gameBoard[sender.row][sender.col] = gameStatus.markChoice()
    }
    
    func checkGameStatus() {
        if gameStatus.confirmWinCondition() {
            winMessage.text = "Wins!"
            gameStatus.increaseWinTally()
            scores.text = "Player 1   \(TicTacToeBrain.winTracker.0):\(TicTacToeBrain.winTracker.1)  Player 2"
            GameButton.buttonState(gameButtons, false)
        } else if GameButton.checkIfDraw(gameButtons) {
            winMessage.text = "Draw!"
            scores.text = "Player 1   \(TicTacToeBrain.winTracker.0):\(TicTacToeBrain.winTracker.1)  Player 2"
        } else {
            gameStatus.alternateTurn()
            turnPlayer.text = gameStatus.displayTurnPlayer()
        }
    }
}

