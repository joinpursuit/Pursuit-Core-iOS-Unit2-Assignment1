//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    @IBOutlet var xOrOButtons: [GameButton]!
    @IBOutlet weak var playTurnDisplay: UILabel!
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonPressXorO(_ sender: GameButton) {
        
        TicTacToeBrain.xOrO(sender)
        TicTacToeBrain.xTurn.toggle()
        TicTacToeBrain.playerTurn(playTurnDisplay)
        sender.isEnabled.toggle()
        TicTacToeBrain.winCheck(xOrOButtons, playTurnDisplay)
        TicTacToeBrain.movesMade += 1
        if TicTacToeBrain.movesMade == 9 && (playTurnDisplay.text != "Player 1 Won!" && playTurnDisplay.text != "Player 2 Won!") {
            playTurnDisplay.text = "Draw! Play Again?"
        }
        player1Score.text = "\(TicTacToeBrain.scoreOne)"
        player2Score.text = "\(TicTacToeBrain.scoreTwo)"
        // Fallback on earlier versions
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        TicTacToeBrain.movesMade = 0
        TicTacToeBrain.xTurn = true
        TicTacToeBrain.playerTurn(playTurnDisplay)
        for button in xOrOButtons {
            button.isEnabled = true
            button.setBackgroundImage(nil, for: .disabled)
        }
    }
}
