//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

// this is on this is off
import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [GameButton]!
    
let brain = TicTacToeBrain()
    
  override func viewDidLoad() {
  super.viewDidLoad()
  
    }

    @IBAction func buttonPressed(_ sender: GameButton) {
        brain.gameMove()
        if brain.player1 {
            brain.gameboard[sender.row][sender.col] = osymbol
            sender.setImage(UIImage.init(named: "otto"), for: .normal)
            brain.gameResult()
            if brain.player1wins {
                print("Player 1 Wins!")
            }
        } else if brain.player2 {
                brain.gameboard[sender.row][sender.col] = xsymbol
                sender.setImage(UIImage.init(named: "xtto"), for: .normal)
                brain.gameResult()
                if brain.player2wins {
                    print("Player 2 Wins!")
                }
            }
        }
    }
    


