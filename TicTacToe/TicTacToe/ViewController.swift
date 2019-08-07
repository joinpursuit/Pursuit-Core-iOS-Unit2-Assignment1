//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sunni Tang on 08/1/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var currentPlayer: Player = .playerOne
    var currentBoard = TicTacToeBrain.init()
    
    @IBAction func changeButton(_ sender: UIButton) {
        switch currentPlayer {
            case .playerOne:
                sender.setTitle("O", for: .normal)
                sender.isEnabled = false
                playerTurnLabel.text = "Player Two's turn!"

            case .playerTwo:
                sender.setTitle("X", for: .normal)
                sender.isEnabled = false
                playerTurnLabel.text = "Player One's turn!"

        }
        currentPlayer.switchPlayer()
        currentBoard.updateBoard(tag:sender.tag)
        
        if currentBoard.checkForWin() {
            changeLabelWinner()
            for button in buttons {
                button.isEnabled = false
            }
        } else if currentBoard.totalMoves == 9 {
            playerTurnLabel.text = "It's a draw!"
        }
    }
    
    

    func changeLabelWinner() {
        switch currentBoard.winner {
        case 1:
            playerTurnLabel.text = "Player One wins!"
            playerOneScore.text = "Player One: \(currentBoard.playerOneCounter)"
        case 2:
            playerTurnLabel.text = "Player Two wins!"
            playerTwoScore.text = "Player Two: \(currentBoard.playerTwoCounter)"
        default:
            print("This shouldn't happen")
        }
    }
    
    
    @IBAction func startNewGame(_ sender: UIButton) {
        currentBoard.resetBoard()
        playerTurnLabel.text = "Player One's turn!"
        for button in buttons {
            button.isEnabled = true
            button.setTitle("", for: .normal)
        }
        currentPlayer = Player.playerOne
    }
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
  }


}

