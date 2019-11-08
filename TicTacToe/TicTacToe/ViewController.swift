//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // creating array of buttons(collection)
    @IBOutlet var gameButtons: [GameButton]!
    
    
    @IBOutlet weak var winLoseLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         winLoseLabel.backgroundColor = .orange
       
    }
    let gameBrain = TicTacToeBrain()
    
    @IBAction func gameButtonPressed(_ sender: GameButton) {
        gameBrain.gameButtonPressed(sender)
        /*let gameEnd */ gameBrain.winner()
        
//        if gameEnd == false{
//            for gameButton in gameButtons{
//                gameButton.isEnabled = false
//            }
//        }
        winLoseLabel.text = gameBrain.thereIsAWinner(name: gameBrain.gameIsActive)
        
        print(gameBrain.thereIsAWinner(name: gameBrain.gameIsActive))
        //
        //       print(" row \(gameButton.row) at column \(gameButton.col) was pressed")
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        gameBrain.gameIsActive = true
        winLoseLabel.text = "Let's Play!"
        for button in gameButtons {
            button.setImage(nil, for: .normal)
            gameBrain.newGame()
        }
        print(gameBrain.gameState)
    }
    
}

