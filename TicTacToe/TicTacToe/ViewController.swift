//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var game = TicTacToeBrain() // instance 

    
    @IBOutlet var gameButtons: [GameButton]!
        
    @IBOutlet weak var ticTacToe: UILabel!
    
    @IBOutlet weak var board: UIImageView!
    
    @IBOutlet weak var gameStatsLabel: UILabel!
    
    
//TODO: create an instance of brain class
    
  override func viewDidLoad() {
    super.viewDidLoad()
    ticTacToe.text = "Tic Tac Toe"

    
  }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        gameStatsLabel.text = ""
        
        for button in gameButtons {
            button.isEnabled = true
        }
        
        game.boardMatrix = [["","",""],["","",""],["","",""]]
        playerX = false
    }
    
    @IBAction func gameButtonPressed(_ gameButton: GameButton) {

        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .black, scale: .large)
        let xmarkImage = UIImage(systemName: "xmark", withConfiguration: config)
        let omarkImage = UIImage(systemName: "circle", withConfiguration: config)
        
        playerX.toggle()
        game.populate(gameButton)
        
        if playerX {
            gameButton.setImage(xmarkImage, for: .normal)
            gameStatsLabel.text = "Player 2's turn"
            gameButton.isEnabled = false
            
        } else {
            gameButton.setImage(omarkImage, for: .normal)
            gameStatsLabel.text = "Player 1's turn"
            gameButton.isEnabled = false
        }
        
        gameStatsLabel.text = game.winRow()
       

    }

}


