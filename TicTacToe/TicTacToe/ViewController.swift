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
        player1Turn.text = "Player One - \"x\"      wins: "
        player2Turn.text = "Player Two - \"o\"      wins: "
        for button in arrayOfButtons{
            button.isEnabled = true
        }
    }
    
    
    @IBAction func moveMade(_ sender: GameButton) {
        let ticToeIndex = (sender.row, sender.col)
        
        ticTacToeBrain.play(move: ticToeIndex)
        
        currentButton = arrayOfButtons[sender.tag]
        
        instructions.text = ticTacToeBrain.playerMessage
        
        currentButton.setImage(ticTacToeBrain.playerImage, for: .normal)
        
        currentButton.isUserInteractionEnabled = false
        
        ticTacToeBrain.keepTracKInWinningarray(ticToeIndex: ticToeIndex)
        
        ticTacToeBrain.whoWins(possibleWinningCombinations: ticTacToeBrain.winMatrix)
        
        
        
        if ticTacToeBrain.playerOneWins || ticTacToeBrain.playerTwoWins{
         ticTacToeBrain.disableGame(array: arrayOfButtons)
        }
    }
    
    
    
    
    
    @IBAction func playAgain(_ sender: UIButton){
        setUp()
        //i need to remove all images
    }
    
}
