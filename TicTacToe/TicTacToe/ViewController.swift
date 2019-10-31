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

        // Fallback on earlier versions
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        TicTacToeBrain.xTurn = true
        TicTacToeBrain.playerTurn(playTurnDisplay)
        
        for button in xOrOButtons {
            button.isEnabled = true
            button.setBackgroundImage(nil, for: .disabled)
        }
    }
}

