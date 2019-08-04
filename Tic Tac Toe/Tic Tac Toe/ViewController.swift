//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Michelle Cueva on 8/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class TicTacButton: UIButton {
    @IBInspectable var row: Int = 0
    @IBInspectable var col: Int = 0
}

class ViewController: UIViewController {
    
    let playO = UIImage(named: "playO")
    let playX = UIImage(named: "playX")
    var currentPlayer = Player(rawValue: 1) {
        didSet {
            playerLabel.text = self.currentPlayer?.printPlayer()
        }
    }
    var gameState = Game()
    
    @IBOutlet var gameButtons: [TicTacButton]!
    
    @IBOutlet weak var newGameLabel: UIButton!
    
    @IBOutlet weak var playerLabel: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: TicTacButton) {
        if !gameState.isAvailable(row: sender.row, col: sender.col) {
            return
        }
        
        let Image = (currentPlayer == Player.player1) ? playX : playO
        sender.setImage(Image, for: .normal)
        
        gameState.disable(row: sender.row, col: sender.col, value:currentPlayer!.rawValue )
        gameState.decrementAvailableSpots()
        
        if gameState.checkWin(row: sender.row, col: sender.col) {
            
            playerLabel.text = currentPlayer?.printWinningPlayer()
            
            newGameLabel.titleLabel?.text = "   Reset"
//            newGameLabel.titleLabel?.textAlignment = .center
            gameState.gameDone = true
            
        } else if gameState.availableSpots == 0 {
            playerLabel.text = "No Winner"
            newGameLabel.titleLabel?.text = "   Reset"
            
        } else  {
            currentPlayer?.switchPlayer()
        }
        
    }
    
    
    @IBAction func newGameButton(_ sender: UIButton) {
        gameState.reset()
        currentPlayer = Player.player1
        newGameLabel.titleLabel?.text = "New Game"
        gameState.gameDone = false
        
        for button in gameButtons {
            button.setImage(nil, for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}



