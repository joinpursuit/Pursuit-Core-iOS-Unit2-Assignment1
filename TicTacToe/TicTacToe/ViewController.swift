//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
 // creating array of buttons(collection)
    @IBOutlet var gameButtons: [GameButton]!
   var activePlayer = 1 // cross
   var gameState = [0,0,0,0,0,0,0,0,0]
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
    
  
    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        if gameState[gameButton.tag] == 0 {
            gameState[gameButton.tag] = activePlayer
            
        if activePlayer == 1 {
            gameButton.setImage(UIImage(named: "cross"), for: .normal)
            activePlayer = 2
        } else {
            gameButton.setImage(UIImage(named: "nought"), for: .normal)
            activePlayer = 1
        }
//        print(" row \(gameButton.row) at column \(gameButton.col) was pressed")
    }
    

}
}
