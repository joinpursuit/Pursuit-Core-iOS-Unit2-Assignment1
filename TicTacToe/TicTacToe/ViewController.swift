//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var xOrOButtons: [GameButton]!
    @IBOutlet weak var playTurnDisplay: UILabel!
    
    var xOrO = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonPressXorO(_ sender: GameButton) {
        
        TicTacToeBrain.xOrO(sender)
        TicTacToeBrain.xTurn.toggle()
        
        sender.isEnabled.toggle()
        // Fallback on earlier versions
    }
    
}

