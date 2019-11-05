//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var game = TicTacToeBrain()
    
    
    @IBOutlet var gamePieceButtons: [GameButton]!
    @IBAction func buttonPressed(_ sender: GameButton) {
        if !game.isWin {
            if game.player == 2 {
                gameStatusLabel.text = "Player One's Turn"
            } else {
                gameStatusLabel.text = "Player Two's Turn"
            }
            game.placePiece(sender)
            if game.drawOrNot() == true {
                gameStatusLabel.text = "Draw, Press New Game To Play Again"
            }
            if game.isWin {
                gameStatusLabel.text = game.win()
            }
        }
    }
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    @IBOutlet weak var newGameButtonOutlet: UIButton!
    @IBAction func newGameButton(_ sender: UIButton) {
        game.gameRestart()
        gameStatusLabel.text = "Player One's Turn"
        for button in gamePieceButtons {
            button.setBackgroundImage(nil, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAttributes()
    }
    
    private func viewAttributes() {
        gameStatusLabel.attributes()
        newGameButtonOutlet.attributes()
    }
    
}


