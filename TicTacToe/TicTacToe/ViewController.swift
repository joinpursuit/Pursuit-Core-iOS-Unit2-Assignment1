//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var gameButtonsOutletCollection: [UIButton]!
    
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    var activePlayer = 1 // Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var totalScorePlayer1 = 0
    var totalScorePlayer2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStatusLabel.text = """
        Welcome to Tic Tac Toe game!
        Player 1 starts with X.
        """
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activePlayer = 1 // Cross
        
        playAgainButton.isHidden = false
        gameStatusLabel.isHidden = false
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for:   UIControl.State.normal)
            
            for gameButtonOutlet in gameButtonsOutletCollection {
                gameButtonOutlet.isEnabled = true
            }
        }
//    var activePlayer = 1 // Cross
//    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
//
//   @IBOutlet var gameButtons: [GameButton]!
//    @IBOutlet weak var gameStatusLabel: UILabel!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        gameStatusLabel.layer.borderColor = UIColor.systemBlue.cgColor
//        gameStatusLabel.layer.borderWidth = 2.0
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    }
    
    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        if gameState[gameButton.tag - 1] == 0 {
            
            gameState[gameButton.tag - 1] = activePlayer
            
            if activePlayer == 1 {
                
//<<<<<<< HEAD
                gameButton.setImage(UIImage(named: "Cross.png"), for: UIControl.State.normal)
                activePlayer = 2
                gameStatusLabel.text = """
                Player two's turn.
                Place an O.
                """
            } else {
                gameButton.setImage(UIImage(named: "Circle.png"), for: UIControl.State.normal)
                activePlayer = 1
                gameStatusLabel.text = """
                Player one's turn.
                Place an X.
                """
            }
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    if gameState[combination[0]] == 1 {
                        totalScorePlayer1 += 1
                        gameStatusLabel.text = """
                        CROSS WON!
                        YOUR TOTAL SCORE IS \(totalScorePlayer1)!
                        """
                        for gameButtonOutlet in gameButtonsOutletCollection {
                            gameButtonOutlet.isEnabled = false
                        }
                        playAgainButton.isHidden = false
                        gameStatusLabel.isHidden = false
                        
                    } else if gameState[combination[0]] == 2 {
                        totalScorePlayer2 += 1
                        gameStatusLabel.text = """
                        CIRCLE WON!
                        YOUR TOTAL SCORE IS \(totalScorePlayer2)!
                        """
                        for gameButtonOutlet in gameButtonsOutletCollection {
                            gameButtonOutlet.isEnabled = false
                        }
                        
                        playAgainButton.isHidden = false
                        gameStatusLabel.isHidden = false
                    }
                }
                
            }
            if !gameState.contains(0) {
                gameStatusLabel.text = """
                THE GAME IS TIGHT.
                START PLAYING A NEW GAME.
                """
                playAgainButton.isHidden = false
                gameStatusLabel.isHidden = false
            }
        }
    }
}
//=======
                   // gameButton.setImage(UIImage(named: "Cross.png"), for: UIControl.State.normal)
                   // activePlayer = 2
//>>>>>>> 009ca7bc1c6d3a3815976f668390dba9bf5acf55
//
//                } else {
//                    gameButton.setImage(UIImage(named: "Circle.png"), for: UIControl.State.normal)
//                    activePlayer = 1
//                       }
//        }
//
//        }
//
//    }
    
    
//        sender.setBackgroundImage(UIImage(named: "Button-Normal"), for: UIControl.State.normal)
    
//    @IBAction func resetButton(_ sender: UIButton) {
//          }
//    
//}
   
