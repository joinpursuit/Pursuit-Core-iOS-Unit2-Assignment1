//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    var ticTacToeBrainInstance = TicTacToeBrain()
    var playerInstance = Player.player1
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var allButtons: [GameButton]!
    @IBOutlet weak var turnCounterLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    var turnCounterNumber = 1
    var player1 = PlayerStats(playerName: "Player1", playerShape: "O", playerScore: 0)
    var player2 = PlayerStats(playerName: "Player2", playerShape: "X", playerScore: 0)
    
    @IBAction func backButtonPress(_ sender: UIButton) {
        performSegue(withIdentifier: "backToTitle", sender: self)
        player1.playerScore = 0
        player2.playerScore = 0
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        resetButtons()
        ticTacToeBrainInstance.resetGameBoard()
        resetLabels()
    }
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        ticTacToeBrainInstance.updateGameBoard(player: playerInstance, row: sender.row, col: sender.col)
        let result = ticTacToeBrainInstance.checkGameState()
        switch result {
        case .player1wins:
            updateButtons(row: sender.row, col: sender.col, player: playerInstance)
            resultLabel.text = "\(player1.playerName) Wins!"
            resultLabel.textColor = UIColor(displayP3Red: 0.773, green: 0.992, blue: 0.482, alpha: 1)
            resultLabel.shake()
            for buttons in allButtons {
                buttons.isEnabled = false
            }
            newGameButton.fadeIn()
            backButton.fadeIn()
            player1.playerScore += 1
            player1Score.text = "\(player1.playerShape): \(player1.playerScore)"
            player2Score.text = "\(player2.playerShape): \(player2.playerScore)"
            
            
            
            
        case .player2wins:
            updateButtons(row: sender.row, col: sender.col, player: playerInstance)
            resultLabel.text = "\(player2.playerName) Wins!"
            resultLabel.textColor = UIColor(displayP3Red: 0.773, green: 0.992, blue: 0.482, alpha: 1)
            resultLabel.shake()
            for buttons in allButtons {
                buttons.isEnabled = false
            }
            newGameButton.fadeIn()
            backButton.fadeIn()
            player2.playerScore += 1
            player1Score.text = "\(player1.playerShape): \(player1.playerScore)"
            player2Score.text = "\(player2.playerShape): \(player2.playerScore)"
            
        case .ongoing:
            updateButtons(row: sender.row, col: sender.col, player: playerInstance)
            playerInstance.alternate()
            if playerInstance == Player.player1 {
                resultLabel.text = "\(player1.playerName)'s Move"
                 resultLabel.textColor = UIColor(displayP3Red: 1.00, green: 0.343, blue: 0.358, alpha: 1)
            } else {
                resultLabel.text = "\(player2.playerName)'s Move"
                resultLabel.textColor = UIColor(displayP3Red: 0.420, green: 0.597, blue: 1.00, alpha: 1)
            }
            
        case .tie:
            updateButtons(row: sender.row, col: sender.col, player: playerInstance)
            resultLabel.text = "Tie!"
            resultLabel.textColor = UIColor(displayP3Red: 0.773, green: 0.992, blue: 0.482, alpha: 1)
            newGameButton.fadeIn()
            backButton.fadeIn()
        }
    }
    
    
    func updateButtons(row: Int, col: Int, player: Player) {
        turnCounterNumber += 1
        if turnCounterNumber == 10 {
            turnCounterNumber = 9
        }
        turnCounterLabel.text = "Turn \(turnCounterNumber)"
        for button in allButtons {
            if button.row == row && button.col == col {
                switch player {
                case .player1:
                    button.setTitle("\(player1.playerShape)", for: .normal)
                    button.isEnabled = false
                    
                case .player2:
                    button.setTitle("\(player2.playerShape)", for: .normal)
                    button.isEnabled = false
                }
            }
        }
    }
    
    
    func resetButtons(){
        for button in allButtons {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
        newGameButton.alpha = 0.0
        backButton.alpha = 0.0
    }
    
    
    func resetLabels(){
        playerInstance = Player.player1
        resultLabel.text = "\(player1.playerName)'s Move"
        resultLabel.textColor = UIColor(displayP3Red: 1.00, green: 0.343, blue: 0.358, alpha: 1)
        turnCounterNumber = 1
        turnCounterLabel.text = "Turn \(turnCounterNumber)"
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newGameButton.alpha = 0.0
        backButton.alpha = 0.0
        [turnCounterLabel, resultLabel].forEach({ $0?.textAlignment = NSTextAlignment.center})
        resultLabel.text = "\(player1.playerName)'s Move"
        resultLabel.textColor = UIColor(displayP3Red: 1.00, green: 0.343, blue: 0.358, alpha: 1)
        player1Score.textColor = UIColor(displayP3Red: 1.00, green: 0.343, blue: 0.358, alpha: 1)
        player2Score.textColor = UIColor(displayP3Red: 0.420, green: 0.597, blue: 1.00, alpha: 1)
        player1Score.text = "\(player1.playerShape): \(player1.playerScore)"
        player2Score.text = "\(player2.playerShape): \(player2.playerScore)"
        
        turnCounterLabel.text = "Turn \(turnCounterNumber)"
        for button in allButtons {
            button.titleLabel?.fadeIn()
        }
        newGameButton.layer.cornerRadius = newGameButton.frame.height / 2
        newGameButton.layer.borderColor = UIColor.white.cgColor
        newGameButton.layer.borderWidth = 2.0
    
    }
}

