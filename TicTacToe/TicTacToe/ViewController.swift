//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var brain = TicTacToeBrain.init().winCondition()
    
    @IBOutlet var gameButtons: [GameButton]!
    
    
    @IBOutlet weak var board: UIImageView!
    
    @IBOutlet weak var gameStatsLabel: UILabel!
    
    

    
  override func viewDidLoad() {
    super.viewDidLoad()
    gameStatsLabel.text = "Tic Tac Toe"
    
  }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        
    }
    
    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .black, scale: .large)
        let xmarkImage = UIImage(systemName: "xmark", withConfiguration: config)
        let omarkImage = UIImage(systemName: "circle", withConfiguration: config)
        
        playerX.toggle()
        
        if playerX {
            gameButton.setImage(xmarkImage, for: .normal)
            gameButton.isEnabled = false
            gameStatsLabel.text = "Player 2's turn"
        } else {
            gameButton.setImage(omarkImage, for: .normal)
            gameStatsLabel.text = "Player 1's turn"
            gameButton.isEnabled = false
            
        }
        
        gameStatsLabel.text = brain
        
        

    }
    


}

