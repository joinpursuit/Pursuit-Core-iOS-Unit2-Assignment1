//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jack Wong on 8/8/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var allButtons: [GameButton]!
    @IBOutlet weak var blackSubView: UIView!
    
    @IBOutlet weak var playerOneScore: UILabel!
    
    @IBOutlet weak var playerTwoScore: UILabel!
    
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCSS(allButtons)
        newGameBtnCSS(newGameButton)
        setNewGame()
    }
    
    var playerOne = player(playerName: "Player One", playerMark: "X")
    var playerTwo = player(playerName: "Player Two", playerMark: "O")
    var playerTurn = 0  //player turn 1-playerOne 2-playerTwp
    
    @IBAction func moveDecision(_ sender: GameButton) {
        
        sender.pulsate()
        sender.isEnabled = false

        if playerTurn % 2 == 0{
            sender.setTitleColor(.blue, for: .disabled)
            sender.setTitle("\(playerOne.playerMove(sender.tag))", for: .disabled)

            statusLabel.text = "Player Two's turn! (O)"

            playerTurn += 1

            if playerOne.didPlayerWin(){
                statusLabel.text = "Player One won!"
                playerOneScore.text = String(playerOne.winCount)
                disableBoard()
                for i in playerOne.winningCombo{
                    if let button = self.view.viewWithTag(i) as? UIButton
                    {
                        button.backgroundColor = UIColor.green
                        button.pulsate()
                        button.flash()
                    }
                }
            }else if !playerOne.didPlayerWin() && playerTurn == 9{

                statusLabel.text = "Draw!"
                disableBoard()
            }

        }else{
            sender.setTitleColor(.red, for: .disabled)
            sender.setTitle("\(playerTwo.playerMove(sender.tag))", for: .disabled)

            statusLabel.text = "Player One's turn! (X)"

            playerTurn += 1

            if playerTwo.didPlayerWin(){
                statusLabel.text = "Player Two won!"
                playerTwoScore.text = String(playerTwo.winCount)
                disableBoard()

                for i in playerTwo.winningCombo{
                    if let button = self.view.viewWithTag(i) as? UIButton
                    {
                        button.backgroundColor = UIColor.green
                        button.pulsate()
                        button.flash()
                    }
                }

            }else if !playerTwo.didPlayerWin() && playerTurn == 9{
                statusLabel.text = "Draw!"
                disableBoard()
            }
        }
    }
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        setNewGame()
    }
    
    func setNewGame(){
        //clear move list
        playerOne.clearMoves()
        playerTwo.clearMoves()
        
        //set player turn and change label to reflect player turn
        statusLabel.text = "Player 1's Turn!"
        playerTurn = 0
        
        //clearing the board
        for button in allButtons{
            button.setTitle("", for: .disabled)
            button.isEnabled = true
            button.backgroundColor = .lightGray
//            button.setTitle("", for: .normal)
        }
        
    }
    
    func disableBoard(){
        for button in allButtons{
            button.isEnabled = false
        }
    }
}
