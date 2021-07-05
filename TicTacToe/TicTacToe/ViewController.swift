//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    var gameButton = [UIButton]()
    
    var ticTacToeGame: gameBrain = gameBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
       gameButton = [btn1, btn2, btn2,btn3, btn4, btn5, btn6, btn7, btn8, btn9]
   

    }
    
      @IBOutlet weak var playAgainLable: UILabel!
    @IBAction func allButtons(_ sender: GameButton) {
        let turns = ticTacToeGame.playerTurn
        sender.setImage(turns.image(), for: .normal)
        ticTacToeGame.gameSetUp(row: sender.row, col: sender.col)
        switch ticTacToeGame.winningConditions() {
        case .player1Win:
            playAgainLable.text = "Player one: You're the winner!"
            for button in gameButton {
                button.isEnabled = false
            }
        case .player2win:
            playAgainLable.text = "Player tow: You're the winner!"
            for button in gameButton {
                button.isEnabled = false
            }
        case .noOneWins:
            playAgainLable.text = "No Winners -_-"
            for button in gameButton {
                button.isEnabled = false
                
                 sender.isEnabled = false
            }
        }
        }
        
    @IBAction func playButton(_ sender: UIButton) {
       
        let turns = ticTacToeGame.playerTurn
        for button in gameButton {
            button.isEnabled = true
            playAgainLable.text = "Click To Play"
        }
        
    }
    }
    
    

    
    

   
    
    
         

    
    
    
    
    
    
    

 
        
        

   
   
    

   
    



