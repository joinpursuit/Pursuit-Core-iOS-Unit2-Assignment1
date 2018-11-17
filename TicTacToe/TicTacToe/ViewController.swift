//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

//THIS HANGDLES IF BUTTONS ARE ACTIVE OR INACTIVE


//BUTTON ISHIDDEN(NOT THIS CASE)...  ISENABLED - IS ON BOARD BUT NOT ACTIVE

//TRANSPARENT BUTTON IS THE KEY




class ViewController: UIViewController {
    
    
    @IBOutlet weak var cuadriculaImage: UIImageView!
    
    @IBOutlet weak var player1Turn: UILabel!
    
    @IBOutlet weak var player2Turn: UILabel!
    
    @IBOutlet var arrayOfButtons: [GameButton]!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var instructions: UITextView!//can also be used to promp who is next...
    
    
    
    var tag = 0
    var currentButton = GameButton()
    
    private var ticTacToeBrain = TicTacToeBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    func setUp(){
        instructions.text = "Click on any square on the table to begin the game!"
        player1Turn.text = "Player One - \"x\""
        player2Turn.text = "Player Two - \"o\""
        arrayOfButtons.forEach{$0.isEnabled = true}
        arrayOfButtons.forEach{$0.isUserInteractionEnabled = true}
    }
    
    
    @IBAction func moveMade(_ sender: GameButton) {
        let ticToeIndex = (sender.row, sender.col)
        
        ticTacToeBrain.play(move: ticToeIndex)
        
        currentButton = arrayOfButtons[sender.tag]
        
        currentButton.setImage(ticTacToeBrain.playerImage, for: .normal)
        
        currentButton.isUserInteractionEnabled = false
        
        ticTacToeBrain.keepTracKInWinningarray(ticToeIndex: ticToeIndex)
        
        instructions.text = ticTacToeBrain.whoWins(possibleWinningCombinations: ticTacToeBrain.winMatrix)
        
        gameIsOver(gameResult: ticTacToeBrain.gameOver)
    
    }
    
    func gameIsOver(gameResult: Bool){
        if gameResult{
            arrayOfButtons.forEach{$0.isEnabled = false}
        }
    }
    
    
    @IBAction func playAgain(_ sender: UIButton){
        arrayOfButtons.forEach {$0.setImage(nil, for: .normal)}
        arrayOfButtons.forEach {$0.isEnabled = true}
        arrayOfButtons.forEach {$0.isUserInteractionEnabled = true}
        ticTacToeBrain.resetBoard()
        ticTacToeBrain.playerOneTurn = true
        instructions.text = "Click on any square on the table to begin the game!"
    }
}
