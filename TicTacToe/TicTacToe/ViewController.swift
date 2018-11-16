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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

