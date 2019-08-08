//
//  ViewController.swift
//  TicTacToe
//
//  Created by Albert Oliveira on 08/08/2019.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = TicTacToeBrain()
    @IBOutlet var gameButtons: [GameButton]!
    @IBOutlet weak var ticTacToeStatus: UILabel!
    @IBAction func newGame(_ sender: UIButton) {
        newGame()
    }
    @IBAction func variable1(_ sender: GameButton) {
        ticTacToeStatus.text = game.playerNumber
        gameButtons[sender.tag].setTitle(game.player, for: .normal)
        game.updateArray(col: sender.col, row: sender.row)
        sender.isEnabled = false
        
        if game.checkWinnerCol() || game.checkWinnerDiagonal() || game.checkWinnerRow() {
            ticTacToeStatus.text = "The winner is \(game.playerNumber)"
            disableAll()
        }else if game.counter == 9{
            print("i win" + game.player)
            ticTacToeStatus.text = "It's a tie"
            disableAll()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func disableAll (){
        gameButtons.forEach { (button) in
            button.isEnabled = false
        }
    }
    func newGame(){
        game = TicTacToeBrain.init()
        gameButtons.forEach { (button) in
            button.isEnabled = true
            button.setTitle("", for: .normal)
            game = TicTacToeBrain.init()
            ticTacToeStatus.text = game.playerNumber
        }
    }
}

