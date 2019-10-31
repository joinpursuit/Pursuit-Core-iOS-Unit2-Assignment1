//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties of ViewController
    
    @IBOutlet weak var topLeft: GameButton!
    @IBOutlet weak var midLeft: GameButton!
    @IBOutlet weak var bottomLeft: GameButton!
    @IBOutlet weak var topMid: GameButton!
    @IBOutlet weak var midMid: GameButton!
    @IBOutlet weak var bottomMid: GameButton!
    @IBOutlet weak var topRight: GameButton!
    @IBOutlet weak var midRight: GameButton!
    @IBOutlet weak var bottomRight: GameButton!
    @IBOutlet weak var newGameButton: UIButton!
    var buttonArray: [GameButton] = []
    let functionHandler = TicTacToeBrain()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    buttonArray = [topLeft, midLeft, bottomLeft, topMid, midMid, bottomMid, topRight, midRight, bottomRight]
    functionHandler.resetToNothing(buttonArray)
  }

    @IBAction func pressedButton(_ sender: GameButton){
        functionHandler.exe(sender)
    }
    
    @IBAction func resetGame(_ sender: UIButton){
        functionHandler.resetToNothing(buttonArray)
    }

}

