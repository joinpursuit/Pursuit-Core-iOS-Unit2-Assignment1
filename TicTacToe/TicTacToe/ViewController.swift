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
                sender.setTitle("o", for: .normal)
                sender.isEnabled = false
                playerTurnLabel.text = "Player Two's turn!"
                currentPlayer.switchPlayer()
                currentBoard.updateBoard(tag:sender.tag)
                currentBoard.checkForWin()
            
            case .playerTwo:
                sender.setTitle("x", for: .normal)
                sender.isEnabled = false
                playerTurnLabel.text = "Player One's turn!"
                currentPlayer.switchPlayer()
                currentBoard.updateBoard(tag: sender.tag)
                currentBoard.checkForWin()
        }
    }
    

    func changeLabelWinner() {
        if currentBoard.playerOneWins() {
            playerTurnLabel.text = "Player One wins!"
            playerOneScore.text = "Player One: \(playerOneScore)"
        } else if currentBoard.playerTwoWins() {
            playerTurnLabel.text = "Player Two wins!"
            playerTwoScore.text = "Player Two: \(playerTwoScore)"

        }
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
    }
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }


}

