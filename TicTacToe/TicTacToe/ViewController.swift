//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

var game = TicTacToeBrain()
    
    
    @IBOutlet var gamePieceButtons: [GameButton]!
    @IBAction func buttonPressed(_ sender: GameButton) {
        game.placePiece(sender)
        if game.drawOrNot() == true {
            gameStatusLabel.text = "Draw, Press New Game To Play Again"
        }
        if game.isWin {
            gameStatusLabel.text = game.win()
        }
        
    }
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBAction func newGameButton(_ sender: UIButton) {
        game.gameRestart()
        gameStatusLabel.text = ""
        for button in gamePieceButtons {
            button.setBackgroundImage(nil, for: .normal)
        }
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


}

