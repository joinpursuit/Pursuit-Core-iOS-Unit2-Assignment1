//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var ButtonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var newGame: UILabel!
    
    var playerX = Players.playerX
    var playerO = Players.PlayerO
    var turn = 0
    
//    let winCombinations = [
//    [0, 1, 2],
//    [3, 4, 5],
//    [6, 7, 8],
//    [0, 3, 6],
//    [1, 4, 7],
//    [2, 5, 8],
//    [0, 4, 8],
//    [2, 4, 6]
//    ]    
    
    
    @IBAction func gameController(_ sender: UIButton) {
        let X:String = "\u{274C}"
        let O:String = "\u{2B55}"
        
        if turn % 2 == 0 {
            sender.setTitle(X, for: .normal) //unwrap
        } else {
            sender.setTitle(O, for: .normal)
        }
        turn += 1
        print(turn, sender.tag)
    }
    
//
//    private func restartGame() -> Void {
//        newGame.isHidden = false
//    }
//
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
//    newGame.isHidden = true
  }
}

