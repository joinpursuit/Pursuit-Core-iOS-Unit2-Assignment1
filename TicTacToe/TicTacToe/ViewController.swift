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
    var player = Player.player1
    
    @IBOutlet weak var newGameButton: UIButton!
    
    
    @IBOutlet var allButtons: [GameButton]!
    
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        model.updateBoard(player: player, row: sender.row, column: sender.col)
        
        let result = model.checkWin()
        switch result {
        case .player1wins:
            updateButton(row: sender.row, column: sender.col)
            print("Player 1 wins")
            disableButton()
        case .player2wins:
            updateButton(row: sender.row, column: sender.col)
            print("Player 2 wins")
            disableButton()
        case .ongoing:
            updateButton(row: sender.row, column: sender.col)
            player.switchPlayer()
        case .tie:
            print("TIE")
            disableButton()
        }
    }
    
    
    
    @IBAction func newGameButtonPress(_ sender: UIButton) {
        model.resetModel()
        for button in allButtons {
            button.isEnabled = true
            button.setTitle("Button", for: .normal)
        }
    }
    
    func disableButton(){
        for button in allButtons {
            button.isEnabled = false
            
        }
    }
    
    
    func updateButton(row: Int, column: Int) {
        for button in allButtons {
            if button.row == row && button.col == column {
                switch player {
                case .player1 :
                    button.setTitle("O", for: .normal)
                    button.isEnabled = false
                case .player2:
                    button.setTitle("X", for: .normal)
                    button.isEnabled = false
                }
            }
        }
    }
    
    
  override func viewDidLoad() {
    super.viewDidLoad()

  }
    
    
    
    
    


}

