//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameButtons: [GameButton]!
    @IBOutlet weak var userFeedBack: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        gameButton.isEnabled = false
        
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        
    }
    
}

