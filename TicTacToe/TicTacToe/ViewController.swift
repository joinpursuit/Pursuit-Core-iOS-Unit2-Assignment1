//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var playerOneWins = 0
    var playerTwoWins = 0
    
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var scoreTrackerOne: UILabel!
    @IBOutlet var scoreTrackerTwo: UILabel!
    @IBOutlet var playersTurn: UILabel!
    
    @IBOutlet var allButtons: [GameButton]!
    var myMatrix = Array(repeating: Array(repeating: "", count: 3), count: 3)

    var playerTurn = TicTacToeBrain.Player.playerOne
    
    
    @IBAction func chooseSpot(_ sender: GameButton) {
        
        switch playerTurn {
        case .playerOne:
            sender.setTitle("X", for: .normal)
            myMatrix[sender.row][sender.col] = "X"
            playersTurn.text = "Player Two's Turn!"
            
            if TicTacToeBrain.winCondition(matrix: myMatrix, userSymbol: "X") {
                allButtons.forEach {$0.isEnabled = false}
                playersTurn.text = "Player One Wins!"
                playerOneWins += 1
                scoreTrackerOne.text = "Player One's Wins: \(playerOneWins)"
                //increment score by 1
                
            }
        case .playerTwo:
            sender.setTitle("O", for: .normal)
            myMatrix[sender.row][sender.col] = "O"
            playersTurn.text = "Player One's Turn!"
            
            if TicTacToeBrain.winCondition(matrix: myMatrix, userSymbol: "O") {
                allButtons.forEach {$0.isEnabled = false}
                playersTurn.text = "Player Two Wins!"
                playerTwoWins += 1
                scoreTrackerTwo.text = "Player Two's Wins: \(playerTwoWins)"
            }
        }

        playerTurn.switchPlayer()
        sender.isEnabled = false
        
    }
    @IBAction func resetGame(_ sender: UIButton) {
        for button in allButtons {
            button.isEnabled = true
            button.setTitle("", for: .normal)
        }
        playerTurn = TicTacToeBrain.Player.playerOne
        myMatrix = Array(repeating: Array(repeating: "", count: 3), count: 3)
        playersTurn.text = "Player One's Turn!"
    }

}

