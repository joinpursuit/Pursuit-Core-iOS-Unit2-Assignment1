//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameOver = false
    var gameBrain = TicTacToeBrain()
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var button1: GameButton!
    @IBOutlet weak var button2: GameButton!
    @IBOutlet weak var button3: GameButton!
    @IBOutlet weak var button4: GameButton!
    @IBOutlet weak var button5: GameButton!
    @IBOutlet weak var button6: GameButton!
    @IBOutlet weak var button7: GameButton!
    @IBOutlet weak var button8: GameButton!
    @IBOutlet weak var button9: GameButton!
    
    @IBOutlet weak var whoWillStart: UILabel!
    @IBOutlet weak var player1: UIButton!
    @IBOutlet weak var player2: UIButton!
    @IBOutlet weak var playerTurnStatus: UILabel!
    var playerSymbol = ""
    let xIcon:UIImage? = UIImage(named: "x.png")
    let oIcon:UIImage? = UIImage(named: "o.png")
    
    override func viewDidLoad() {
    super.viewDidLoad()
        whoWillStart.isHidden = false
        player1.isHidden = false
        player2.isHidden = false
        playerTurnStatus.isHidden = true
        playAgainButton.isHidden = true
        
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        button5.isEnabled = false
        button6.isEnabled = false
        button7.isEnabled = false
        button8.isEnabled = false
        button9.isEnabled = false
    // Do any additional setu p after loading the view, typically from a nib.
  }

    
    func gameStuff(symbol: String, button: UIButton) {
        if symbol == gameBrain.player1 {
            button.setImage(xIcon, for: UIControl.State.normal)
            button.isEnabled = false
            playerSymbol = gameBrain.player2
            playerTurnStatus.text = "Player 2, it's your turn!"
        } else if symbol == gameBrain.player2 {
            button.setImage(oIcon, for: UIControl.State.normal)
            button.isEnabled = false
            playerSymbol = gameBrain.player1
            playerTurnStatus.text = "Player 1, it's your turn!"
        }
    }
    
    
    
    @IBAction func buttonToPlayAgain(_ sender: UIButton) {
        resetGame()
        viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        
        switch sender.tag {
        case 1:
            gameStuff(symbol: playerSymbol, button: button1)
            gameBrain.addPlayerMoveToMovesBank(tag: 1, playerSymbol: playerSymbol)
        case 2:
            gameStuff(symbol: playerSymbol, button: button2)
            gameBrain.addPlayerMoveToMovesBank(tag: 2, playerSymbol: playerSymbol)
        case 3:
            gameStuff(symbol: playerSymbol, button: button3)
            gameBrain.addPlayerMoveToMovesBank(tag: 3, playerSymbol: playerSymbol)
        case 4:
            gameStuff(symbol: playerSymbol, button: button4)
            gameBrain.addPlayerMoveToMovesBank(tag: 4, playerSymbol: playerSymbol)
        case 5:
            gameStuff(symbol: playerSymbol, button: button5)
            gameBrain.addPlayerMoveToMovesBank(tag: 5, playerSymbol: playerSymbol)
        case 6:
            gameStuff(symbol: playerSymbol, button: button6)
            gameBrain.addPlayerMoveToMovesBank(tag: 6, playerSymbol: playerSymbol)
        case 7:
            gameStuff(symbol: playerSymbol, button: button7)
            gameBrain.addPlayerMoveToMovesBank(tag: 7, playerSymbol: playerSymbol)
        case 8:
            gameStuff(symbol: playerSymbol, button: button8)
            gameBrain.addPlayerMoveToMovesBank(tag: 8, playerSymbol: playerSymbol)
        case 9:
            gameStuff(symbol: playerSymbol, button: button9)
            gameBrain.addPlayerMoveToMovesBank(tag: 9, playerSymbol: playerSymbol)
        default:
            print("nothing happened")
        }
        returnWhoWon()
        checkForGameOver(gameOver: gameOver)
    }
    

    @IBAction func whoGoesFirst(_ sender: UIButton) {
        if sender.tag == 0 {
            playerSymbol = "x"
        } else if sender.tag == 1 {
            playerSymbol = "o"
        }
        if playerSymbol == "x"{
            playerTurnStatus.text = "Player 1, it's your turn!"
        } else {
            playerTurnStatus.text = "Player 2, it's your turn!"
        }
        whoWillStart.isHidden = true
        player1.isHidden = true
        player2.isHidden = true
        playerTurnStatus.isHidden = false
        
    }
    
    private func checkForGameOver(gameOver: Bool) {
        let winner = returnWhoWon()
        if gameOver == true {
            playerTurnStatus.text = "\(winner) is the winner!"
            playAgainButton.isHidden = false
            
        }

        
    }
    
    private func returnWhoWon() -> String {
        var winner = ""
        let player1 = gameBrain.checkForWinningCombos(playerSymbol: gameBrain.player1)
        let player2 = gameBrain.checkForWinningCombos(playerSymbol: gameBrain.player2)
        if player1 == true {
            winner = "Player 2"
            gameOver = true
        } else if player2 == true {
            winner = "Player 1"
            gameOver = true
        }
        return winner
    }
    
    private func resetGame() {
        gameOver = false
        
        button1.setImage(nil, for: UIControl.State.normal)
        button2.setImage(nil, for: UIControl.State.normal)
        button3.setImage(nil, for: UIControl.State.normal)
        button4.setImage(nil, for: UIControl.State.normal)
        button5.setImage(nil, for: UIControl.State.normal)
        button6.setImage(nil, for: UIControl.State.normal)
        button7.setImage(nil, for: UIControl.State.normal)
        button8.setImage(nil, for: UIControl.State.normal)
        
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true
        button5.isEnabled = true
        button6.isEnabled = true
        button7.isEnabled = true
        button8.isEnabled = true
        button9.isEnabled = true
        
        gameBrain.player1Moves = [[],[],[],[],[],[],[],[]]
        gameBrain.player2Moves = [[],[],[],[],[],[],[],[]]
    }
    
}

