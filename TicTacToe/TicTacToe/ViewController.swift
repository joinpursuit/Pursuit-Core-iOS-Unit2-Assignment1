//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: GameButton!
    @IBOutlet weak var button2: GameButton!
    @IBOutlet weak var button3: GameButton!
    @IBOutlet weak var button4: GameButton!
    @IBOutlet weak var button5: GameButton!
    @IBOutlet weak var button6: GameButton!
    @IBOutlet weak var button7: GameButton!
    @IBOutlet weak var button8: GameButton!
    @IBOutlet weak var button9: GameButton!
    @IBOutlet weak var whoWillStart: UILabel!
    @IBOutlet weak var player1: UIButton!
    @IBOutlet weak var player2: UIButton!
    @IBOutlet weak var playerTurnStatus: UILabel!
    var playerTurn1 = ""
    var playerTurn = WhoGoesFirst()
    let xIcon:UIImage? = UIImage(named: "x.png")
    let oIcon:UIImage? = UIImage(named: "o.png")
    
    override func viewDidLoad() {
    super.viewDidLoad()
        whoWillStart.isHidden = false
        player1.isHidden = false
        player2.isHidden = false
        playerTurnStatus.isHidden = true
    // Do any additional setup after loading the view, typically from a nib.
  }

    
    func gameStuff(symbol: String, button: UIButton) {
        if symbol == "x" {
            button.setImage(xIcon, for: UIControl.State.normal)
            button.isEnabled = false
            playerTurn1 = "o"
        } else if symbol == "o" {
            button.setImage(oIcon, for: UIControl.State.normal)
            button.isEnabled = false
            playerTurn1 = "x"
        }
    }
    
    
    
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        
        switch sender.tag {
        case 1:
            gameStuff(symbol: playerTurn1, button: button1)
        case 2:
            gameStuff(symbol: playerTurn1, button: button2)
        case 3:
            gameStuff(symbol: playerTurn1, button: button3)
        case 4:
            gameStuff(symbol: playerTurn1, button: button4)
        case 5:
            gameStuff(symbol: playerTurn1, button: button5)
        case 6:
            gameStuff(symbol: playerTurn1, button: button6)
        case 7:
            gameStuff(symbol: playerTurn1, button: button7)
        case 8:
            gameStuff(symbol: playerTurn1, button: button8)
        case 9:
            gameStuff(symbol: playerTurn1, button: button9)
        default:
            print("nothing happened")
            //check if any win conditions have been met
        }
        
    }
    

    @IBAction func whoGoesFirst(_ sender: UIButton) {
        if sender.tag == 0 {
            playerTurn1 = "x"
        } else if sender.tag == 1 {
            playerTurn1 = "o"
        }
        whoWillStart.isHidden = true
        player1.isHidden = true
        player2.isHidden = true
    }
    
    
}

