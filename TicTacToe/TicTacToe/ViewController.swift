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
    @IBOutlet weak var turnIndicator: UILabel!
    @IBOutlet weak var xWinsIndicator: UILabel!
    @IBOutlet weak var oWinsIndicator: UILabel!
    var buttonMatrix: [[GameButton]] = [[]]
    let functionHandler = TicTacToeBrain()
    var ohTurn: Bool = false
    var gameOver: Bool = false
    var xWins: Int = 0
    var oWins: Int = 0
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    buttonMatrix = [[topLeft, topMid, topRight], [midLeft, midMid, midRight], [bottomLeft, bottomMid, bottomRight]]
    functionHandler.resetToNothing(buttonMatrix)
    turnIndicator.text = "It is X's move."
    xWinsIndicator.text = "Number of X wins: \(xWins)"
    oWinsIndicator.text = "Number of O wins: \(oWins)"
  }

    @IBAction func pressedButton(_ sender: GameButton){

        if ohTurn && !gameOver{
            functionHandler.oh(sender)
            ohTurn = functionHandler.switchTurn(ohTurn)
            gameOver = functionHandler.didSomeoneWinYet(buttonMatrix, "O")
            turnIndicator.text = "It is X's move."
            if gameOver{
                oWins += 1
                turnIndicator.text = "O Wins"
            }

        } else if !ohTurn && !gameOver {
            functionHandler.exe(sender)
            ohTurn = functionHandler.switchTurn(ohTurn)
            gameOver  = functionHandler.didSomeoneWinYet(buttonMatrix, "X")
            turnIndicator.text = "It is O's move."
            if gameOver{
                xWins += 1
                turnIndicator.text = "X Wins"
            }

        }
        
        if functionHandler.noMovesLeft(buttonMatrix){
            turnIndicator.text = "Draw"
        }
        xWinsIndicator.text = "Number of X wins: \(xWins)"
        oWinsIndicator.text = "Number of O wins: \(oWins)"
    }
    
    @IBAction func resetGame(_ sender: UIButton){
        functionHandler.resetToNothing(buttonMatrix)
        ohTurn = false
        sender.setTitle("New Game", for: .normal)
        gameOver = false
        turnIndicator.text = "It is X's move."
    }

}

