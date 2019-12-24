//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = TicTacToeBrain()
    var player = Players.player1
    
    @IBOutlet var allButtons: [GameButton]!
    
    @IBOutlet weak var playerTurnWinLose: UILabel!
    
    
    @IBAction func buttonPressedForNewGame(_ sender: UIButton) {
        resetBoard()
    }
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        model.updateGameBoard(player: player, row: sender.row, col: sender.col)
        let result = model.checkGameState()
        switch result {
        case .player1Wins:
            updateButtons(row: sender.row, col: sender.col, player: player)
            playerTurnWinLose.text = "Player 1 Wins"
            for button in allButtons {
                button.isEnabled = false
            }
        case .player2Wins:
            updateButtons(row: sender.row, col: sender.col, player: player)
            playerTurnWinLose.text = "Player 2 Wins"
            for button in allButtons {
                button.isEnabled = false
            }
        case .ongoing:
            updateButtons(row: sender.row, col: sender.col, player: player)
            player.alternatePlayers()
            if Players.player1 == player {
                playerTurnWinLose.text = "Player 1, it's your turn"
            } else if Players.player2 == player {
                playerTurnWinLose.text = "Player 2, it's your turn"
            }
        case .tie:
            playerTurnWinLose.text = "TIE"
        }
    }
    override func viewDidLoad() {
    super.viewDidLoad()
        playerTurnWinLose.text = "Player 1, it's your turn"
    // Do any additional setup after loading the view, typically from a nib.
  }
    func updateButtons(row: Int, col: Int, player: Players) {
        for button in allButtons {
            if button.row == row && button.col == col {
                switch player {
                case .player1:
                    button.setTitle("X", for: .normal)
                    button.isEnabled = false
                case .player2:
                    button.setTitle("O", for: .normal)
                    button.isEnabled = false
                }
            }
        }
    }
    
    func resetBoard() {
        for button in allButtons {
            button.setTitle("", for: .normal)
            button.isEnabled = true
            playerTurnWinLose.text = "Player 1, it's your turn"
            player = Players.player1
            model = TicTacToeBrain()
        }
    }


}

