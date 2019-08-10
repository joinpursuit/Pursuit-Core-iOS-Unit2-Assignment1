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
    
    
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        player.alternatePlayers()
        model.updateGameBoard(player: player, row: sender.row, col: sender.col)
        let result = model.checkGameState()
        switch result {
        case .player1Wins:
            updateButtons(row: sender.row, col: sender.col, player: player)
            playerTurnWinLose.text = "Player 1 Wins"
        case .player2Wins:
            updateButtons(row: sender.row, col: sender.col, player: player)
            playerTurnWinLose.text = "Player 2 Wins"
        case .ongoing:
            updateButtons(row: sender.row, col: sender.col, player: player)
        case .tie:
            playerTurnWinLose.text = "TIE"
        }
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
    func updateButtons(row: Int, col: Int, player: Players) {
        for button in allButtons {
            if button.row == row && button.col == col {
                switch player {
                case .player1:
                    button.setTitle("O", for: .normal)
                    button.isEnabled = false
                case .player2:
                    button.setTitle("X", for: .normal)
                    button.isEnabled = false
                }
            }
        }
    }


}

