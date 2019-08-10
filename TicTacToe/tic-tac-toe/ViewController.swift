//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Aaron Pachesa on 8/6/19.
//  Copyright © 2019 Aaron Pachesa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var whosTurn: UILabel!
    
    @IBOutlet weak var buttonOutlets: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBAction func reset(_ sender: UIButton) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activePlayer = 1
        
        buttonOutlets.setImage(UIImage(named: "white"), for: UIControl.State())
        button2.setImage(UIImage(named: "white"), for: UIControl.State())
        b3.setImage(UIImage(named: "white"), for: UIControl.State())
        b4.setImage(UIImage(named: "white"), for: UIControl.State())
        b5.setImage(UIImage(named: "white"), for: UIControl.State())
        b6.setImage(UIImage(named: "white"), for: UIControl.State())
        b7.setImage(UIImage(named: "white"), for: UIControl.State())
        b8.setImage(UIImage(named: "white"), for: UIControl.State())
        b9.setImage(UIImage(named: "white"), for: UIControl.State())
        buttonOutlets.isEnabled = true
        button2.isEnabled = true
        b3.isEnabled = true
        b4.isEnabled = true
        b5.isEnabled = true
        b6.isEnabled = true
        b7.isEnabled = true
        b8.isEnabled = true
        b9.isEnabled = true
        turn = 0
        whosTurn.text = "it's player 1's turn"
    }
    
    

    @IBAction func action(_ sender: UIButton) {
        
        
        
        if gameState[sender.tag - 1] == 0 {
            gameState[sender.tag - 1] = activePlayer
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "o"), for: UIControl.State())
                activePlayer = 2
                turn += 1
                print(gameState)
                whosTurn.text = "it's player 2's turn"
                if gameState[0] == 1 && gameState[1] == 1 && gameState[2] == 1
                    || gameState[3] == 1 && gameState[4] == 1 && gameState[5] == 1
                    || gameState[6] == 1 && gameState[7] == 1 && gameState[8] == 1
                    || gameState[0] == 1 && gameState[3] == 1 && gameState[6] == 1
                    || gameState[1] == 1 && gameState[4] == 1 && gameState[7] == 1
                    || gameState[2] == 1 && gameState[5] == 1 && gameState[8] == 1
                    || gameState[0] == 1 && gameState[4] == 1 && gameState[8] == 1
                    || gameState[2] == 1 && gameState[4] == 1 && gameState[6] == 1 {
                    whosTurn.text = "player 1 wins"
                    buttonOutlets.isEnabled = false
                    button2.isEnabled = false
                    b3.isEnabled = false
                    b4.isEnabled = false
                    b5.isEnabled = false
                    b6.isEnabled = false
                    b7.isEnabled = false
                    b8.isEnabled = false
                    b9.isEnabled = false
                    
                }
                if turn == 9 {
                    buttonOutlets.isEnabled = false
                    button2.isEnabled = false
                    b3.isEnabled = false
                    b4.isEnabled = false
                    b5.isEnabled = false
                    b6.isEnabled = false
                    b7.isEnabled = false
                    b8.isEnabled = false
                    b9.isEnabled = false
                    whosTurn.text = "it's a tie"
                }
            } else if activePlayer == 2 {
                
                sender.setImage(UIImage(named: "x"), for: UIControl.State())
                activePlayer = 1
                turn += 1
                print(gameState)
                whosTurn.text = "it's player 1's turn"
                if gameState[0] == 2 && gameState[1] == 2 && gameState[2] == 2
                    || gameState[3] == 2 && gameState[4] == 2 && gameState[5] == 2
                    || gameState[6] == 2 && gameState[7] == 2 && gameState[8] == 2
                    || gameState[0] == 2 && gameState[3] == 2 && gameState[6] == 2
                    || gameState[1] == 2 && gameState[4] == 2 && gameState[7] == 2
                    || gameState[2] == 2 && gameState[5] == 2 && gameState[8] == 2
                    || gameState[0] == 2 && gameState[4] == 2 && gameState[8] == 2
                    || gameState[2] == 2 && gameState[4] == 2 && gameState[6] == 2 {
                    whosTurn.text = "player 2 wins"
                    buttonOutlets.isEnabled = false
                    button2.isEnabled = false
                    b3.isEnabled = false
                    b4.isEnabled = false
                    b5.isEnabled = false
                    b6.isEnabled = false
                    b7.isEnabled = false
                    b8.isEnabled = false
                    b9.isEnabled = false
                    
                }
                if turn == 9 {
                    buttonOutlets.isEnabled = false
                    button2.isEnabled = false
                    b3.isEnabled = false
                    b4.isEnabled = false
                    b5.isEnabled = false
                    b6.isEnabled = false
                    b7.isEnabled = false
                    b8.isEnabled = false
                    b9.isEnabled = false
                    whosTurn.text = "it's a tie"
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whosTurn.text = "it's player 1's turn"
        // Do any additional setup after loading the view.
    }


}

