//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var playerNumber = 1
    @IBAction func buttonPressed(_ sender: UIButton) {
        if playerNumber == 1 {
        sender.setBackgroundImage(UIImage(systemName: "sun.max"), for: .normal)
            playerNumber = 2
        } else {
            sender.setBackgroundImage(UIImage(systemName: "moon"), for: .normal)
            playerNumber = 1
        }
    }
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBAction func newGameButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


}

