//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Michelle Cueva on 8/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let playO = UIImage(named: "playO")
    let playX = UIImage(named: "playX")
    var currentPlayer = Player(rawValue: 1) {
        didSet {
            playerLabel.text = self.currentPlayer?.printPlayer()
        }
    }
    var gameState = Game()

    @IBOutlet weak var playerLabel: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: TicTacButton) {
        if !gameState.isAvailable(row: sender.row, col: sender.col) {
            return
        }
        
        if currentPlayer == Player.player1 {
            sender.setImage(playX, for: UIControl.State.normal)
        } else {
            sender.setImage(playO, for: UIControl.State.normal)
        }
        gameState.disable(row: sender.row, col: sender.col, value:currentPlayer!.rawValue )
        currentPlayer?.switchPlayer()
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

class TicTacButton: UIButton {
    @IBInspectable var row: Int = 0
    @IBInspectable var col: Int = 0
}

