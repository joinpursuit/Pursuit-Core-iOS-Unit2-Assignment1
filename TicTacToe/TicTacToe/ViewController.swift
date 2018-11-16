//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var boardButtons: [GameButton]!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var resetGame: UIButton!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    var playerTurn = Player.player1
    var playerSymbol = Player.player1.ticTacToeSymbol()
    var numberOfTurnsPassed = 0
    
    var someoneWins = false {
        didSet {
            guard someoneWins else {return}
            
        }
    }
    
    var board = TicTacToeBrain.boardCreator(row: 3, column: 3) {
        didSet {
            guard numberOfTurnsPassed > 4 else {return}
            //activiate the function check for win
        }
    }
    
   
    
    @IBAction func makeAMove(_ square: GameButton) {
        square.setTitle(playerSymbol, for: .normal)
        square.isEnabled = false
        numberOfTurnsPassed += 1
        board[square.row][square.col] = playerSymbol
        
        guard numberOfTurnsPassed < 9 else {
            gameStatusLabel.text = "It's a Draw!"
            boardButtons.forEach{$0.isEnabled = false}
            return
        }
        
        playerTurn.switchPlayer()
        playerSymbol = playerTurn.ticTacToeSymbol()
        gameStatusLabel.text = "Turn: \(playerTurn.rawValue)"
    }
    
    @IBAction func newGame(_ square: UIButton) {
        boardButtons.forEach {(square) -> () in
            square.setTitle("", for: .normal)
            square.isEnabled = true
        }
        
    }
}

