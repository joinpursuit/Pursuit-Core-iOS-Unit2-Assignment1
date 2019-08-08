//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//Create an instance of my model here in the controller
    var gameBrain = TicTacToeBrain()
//set active player status; yes, this should be in the model. Next time.
    var activePlayer = 1
//Game status is a bool.
    var gameIsActive = true
//Player wins label is hidden to start
    @IBOutlet weak var playerWinsLabel: UILabel!
 //Nine buttons with tags
    @IBAction func pressButton(_ sender: UIButton) {
        if gameIsActive == true {
//Update gameState, which is in the model. It keeps track of which buttons were selected and by whom.
            gameBrain.updateGameState(activePlayer: activePlayer, senderTag: sender.tag)
//Changes the image on the button to match the player.
            changeButtonTitle(sender: sender, activePlayer: activePlayer)
//Changes activePlayer
            changeActivePlayer()
//Checks for winner based on a matrix in the model
            checkForWinner(gameStatus: gameBrain.checkGameStatus())
//Sets gameIsActive to false
            gameIsActive = false
            //Checks for a draw based on func (should be in model); game continues if no tie && button left
            checkForDraw(gameState: gameBrain)
            
        }
    }
//Play Again button is hidden to start the game
    @IBOutlet weak var playAgainButton: UIButton!
//Resets the game.
    @IBAction func playAgain(_ sender: UIButton) {
        gameBrain.gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        playerWinsLabel.isHidden = true
       
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
    }
    private func checkForDraw(gameState: TicTacToeBrain) {
            if gameBrain.gameState.contains(0) {
                gameIsActive = true
            }
            if gameIsActive == false {
                playerWinsLabel.text = "It was a draw!"
                playerWinsLabel.isHidden = false
                playAgainButton.isHidden = false
            }
        }
    private func checkForWinner(gameStatus: GameStatus) {
        switch gameStatus {
        case .playerOneWins:
            playerWinsLabel.text = "Player One Wins!"
            playAgainButton.isHidden = false
            playerWinsLabel.isHidden = false
        case .playerTwoWins:
            playerWinsLabel.text = "Player Two Wins!"
            playAgainButton.isHidden = false
            playerWinsLabel.isHidden = false
        case .draw:
            playerWinsLabel.text = "It was a draw!"
            playAgainButton.isHidden = false
            playerWinsLabel.isHidden = false
        default:
            gameIsActive = true
        }
    }
    private func changeActivePlayer() {
        if activePlayer == 1 {
            activePlayer = 2
        } else if activePlayer == 2 {
            activePlayer = 1
        }
    }
    private func changeButtonTitle(sender: UIButton, activePlayer: Int) {
        if activePlayer == 1 {
            sender.setTitle("X", for: .normal)
            sender.isEnabled = false
        } else {
            sender.setTitle("O", for: .normal)
            sender.isEnabled = false
        }
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
}

