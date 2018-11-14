//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Matthew Huie on 11/14/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var ticTacToe = TicTacToeBrain()
    var gameOver = false
    var playerOneWins = 0
    var playerTwoWins = 0
    
    @IBOutlet var allTilesButton: [GameButton]!
    
    @IBOutlet weak var playerOneWinCountLabel: UILabel!
    @IBOutlet weak var playerTwoWinCountLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var resetScoresButton: UIButton!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tic Tac Toe"
        playerOneWinCountLabel.text = "Player 1 Wins: \(playerOneWins)"
        playerTwoWinCountLabel.text = "Player 2 Wins: \(playerTwoWins)"
    }
    
    @IBAction func assigningTiles(_ cardButton: GameButton!) {
        ticTacToe.checkingConditions(a: cardButton.row, b: cardButton.col)
        displayLabel.text = ticTacToe.playerTurnCondition
        if displayLabel.text == "Player One Wins" {
            playerOneWins += 1
        }
        if displayLabel.text == "Player Two Wins" {
            playerTwoWins += 1
        }
        cardButton.setImage(UIImage.init(named: ticTacToe.playerIcon), for: .normal)
        gameOver = ticTacToe.gameOver
        if gameOver == true {
            allTilesButton.forEach{$0.isEnabled = false}
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        ticTacToe.resetGame(a: true)
        allTilesButton.forEach{$0.setImage(UIImage.init(named: "Default Image"), for: .normal)}
        allTilesButton.forEach{$0.isEnabled = true}
        displayLabel.text = "Player One's turn!"
    }
    
    @IBAction func resetScoresButton(_ sender: UIButton) {
        playerOneWins = 0
        playerTwoWins = 0
        playerOneWinCountLabel.text = "Player 1 Wins: \(playerOneWins)"
        playerTwoWinCountLabel.text = "Player 2 Wins: \(playerTwoWins)"
    }  
}

