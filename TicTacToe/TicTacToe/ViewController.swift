//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var turnPlayer: UILabel!
    @IBOutlet var gameButtons: [GameButton]!
    @IBOutlet weak var resetGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GameButton.buttonState(gameButtons, false)
        turnPlayer.text = "Welcome! Ready?"
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        GameButton.buttonState(gameButtons, true)
    }
    
}

