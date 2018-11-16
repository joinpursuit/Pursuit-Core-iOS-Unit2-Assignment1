//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //viewController handles whether buttons are on or off
    @IBOutlet var allButtons: [GameButton]!
    
    var myMatrix = Array(repeating: Array(repeating: "", count: 3), count: 3)
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }
    var playerTurn = TicTacToeBrain.Player.playerOne
    
    
    @IBAction func chooseSpot(_ sender: GameButton) {
        
        switch playerTurn {
        case .playerOne:
            sender.setTitle("X", for: .normal)
        case .playerTwo:
            sender.setTitle("O", for: .normal)
        }
        playerTurn.switchPlayer()
        sender.isEnabled = false
        
    }
    @IBAction func resetGame(_ sender: UIButton) {
        for button in allButtons {
            button.isEnabled = true
            button.setTitle("", for: .normal)
        }
        playerTurn = TicTacToeBrain.Player.playerOne
    }

}

