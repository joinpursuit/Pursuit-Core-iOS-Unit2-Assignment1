//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var xoButtons: [UIButton]!
    @IBOutlet weak var gameStatus: UILabel!
    
    var gameBrain = TicTacToeBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        gameStatus.text = "It's Player1's Turn"
        for button in xoButtons {
            button.setTitleColor(.clear, for: .normal)
        }
    }
    
    @IBAction func xoAction(_ sender: UIButton) {
        if gameBrain.buttonX.count == gameBrain.buttonO.count {
            sender.setBackgroundImage(UIImage(named: "ticTacToeX"), for: .normal)
            gameBrain.buttonX.insert(sender.tag)
            sender.isEnabled = false
            gameStatus.text = "It's Player2's Turn"
        } else {
            sender.setBackgroundImage(UIImage(named: "ticTacToeO"), for: .normal)
            gameBrain.buttonO.insert(sender.tag)
            sender.isEnabled = false
            gameStatus.text = "It's Player1's Turn"
        }
        gameBrain.winningPatern(xoButtons, gameStatus)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        gameBrain.resetGame(xoButtons)
        gameStatus.text = "It's Player1's Turn"
    }
}

