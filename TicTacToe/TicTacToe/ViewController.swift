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
    var playerSymbol = ""
    let xIcon:UIImage? = UIImage(named: "x.png")
    let oIcon:UIImage? = UIImage(named: "o.png")
    
    override func viewDidLoad() {
    super.viewDidLoad()
        whoWillStart.isHidden = false
        player1.isHidden = false
        player2.isHidden = false
        playerTurnStatus.isHidden = true
    // Do any additional setu p after loading the view, typically from a nib.
  }

    
    func gameStuff(symbol: String, button: UIButton) {
        if symbol == "x" {
            button.setImage(xIcon, for: UIControl.State.normal)
            button.isEnabled = false
            playerSymbol = "o"
            playerTurnStatus.text = "Player 2, it's your turn!"
        } else if symbol == "o" {
            button.setImage(oIcon, for: UIControl.State.normal)
            button.isEnabled = false
            playerSymbol = "x"
            playerTurnStatus.text = "Player 1, it's your turn!"
        }
    }
    
    
    
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        
        switch sender.tag {
        case 1:
            gameStuff(symbol: playerSymbol, button: button1)
        case 2:
            gameStuff(symbol: playerSymbol, button: button2)
        case 3:
            gameStuff(symbol: playerSymbol, button: button3)
        case 4:
            gameStuff(symbol: playerSymbol, button: button4)
        case 5:
            gameStuff(symbol: playerSymbol, button: button5)
        case 6:
            gameStuff(symbol: playerSymbol, button: button6)
        case 7:
            gameStuff(symbol: playerSymbol, button: button7)
        case 8:
            gameStuff(symbol: playerSymbol, button: button8)
        case 9:
            gameStuff(symbol: playerSymbol, button: button9)
        default:
            print("nothing happened")
            //check if any win conditions have been met
        }
        
    }
    

    @IBAction func whoGoesFirst(_ sender: UIButton) {
        if sender.tag == 0 {
            playerSymbol = "x"
        } else if sender.tag == 1 {
            playerSymbol = "o"
        }
        if playerSymbol == "x"{
            playerTurnStatus.text = "Player 1, it's your turn!"
        } else {
            playerTurnStatus.text = "Player 2, it's your turn!"
        }
        whoWillStart.isHidden = true
        player1.isHidden = true
        player2.isHidden = true
        playerTurnStatus.isHidden = false
    }
    
    
}

