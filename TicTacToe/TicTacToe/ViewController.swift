//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

   @IBOutlet var gameButtons: [GameButton]!
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStatusLabel.layer.borderColor = UIColor.systemBlue.cgColor
        gameStatusLabel.layer.borderWidth = 2.0
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        if gameState[gameButton.tag - 1] == 0 {
            
            gameState[gameButton.tag - 1] = activePlayer
            
            if activePlayer == 1 {
                
                    gameButton.setImage(UIImage(named: "Cross.png"), for: UIControl.State.normal)
                    activePlayer = 2

                } else {
                    gameButton.setImage(UIImage(named: "Circle.png"), for: UIControl.State.normal)
                    activePlayer = 1
                       }
        }
    
        }
    
    }
    
    
//        sender.setBackgroundImage(UIImage(named: "Button-Normal"), for: UIControl.State.normal)
    
//    @IBAction func resetButton(_ sender: UIButton) {
//          }
//    
//}
   
