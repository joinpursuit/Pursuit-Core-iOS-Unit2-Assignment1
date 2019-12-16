//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = TicTacToeBrain ()
    var player = Player.player1
    
    @IBOutlet weak var playerWin: UILabel!
    
    
    @IBOutlet weak var playerTurn: UILabel!
    
    
    @IBOutlet var allButtons: [GameButton]!
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        model.updateGameBoard(player: player, row: sender.row, col: sender.col)
        let result = model.checkGameState()
        switch result {
        case .player1wins:
            updateButtons(row: sender.row, col: sender.col, player: player)
           // print("Player 1 wins!!!")
            playerWin.text = "Player 1 wins!!!"
            disabler()
        case .player2wins :
            updateButtons(row: sender.row, col: sender.col, player: player)
            //print("Player 2 wins!!!")
            playerWin.text = "Player 2 wins!!!"
            disabler()
        case .ongoing:
            updateButtons(row: sender.row, col: sender.col, player: player)
            player.alternate()
            playerTurn.text = "Next player's turn!"
            
        case .tie:
            //print("It's a TIE!")
            playerTurn.text = "It's a TIE!"
            disabler()
        }
    }
    
    @IBAction func restartGame(_ sender: UIButton) {
        model.resetGameBoard ()
        allButtons.forEach { $0.setTitle(" ", for: .normal)}
        enabler()
        playerWin.text = ""
        playerTurn.text = "Tap a square to begin!"
//        buttonPressed()
    }
    
    func disabler() {
        for i in allButtons {
            i.isEnabled = false
        }
    }
    
    func enabler(){
        for i in allButtons {
            i.isEnabled = true
        }
    }
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    playerWin.text = ""
    playerTurn.text = "Tap a square to begin!"
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }

    func updateButtons(row: Int, col: Int, player: Player) {
        for button in allButtons {
            if button.row == row && button.col == col {
                switch player {
                case .player1:
                    button.titleLabel?.text = "O"
                    button.setTitle("O", for: .normal)
                    button.isEnabled = false
                case .player2:
                    button.titleLabel?.text = "X"
                    button.setTitle("X", for: .normal)
                    button.isEnabled = false
                }
            }
        }
    }
}

