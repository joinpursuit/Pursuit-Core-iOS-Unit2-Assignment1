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
    @IBOutlet weak var newGameComputer: UIButton!
    @IBOutlet weak var turnIndicator: UILabel!
    @IBOutlet weak var xWinsIndicator: UILabel!
    @IBOutlet weak var oWinsIndicator: UILabel!
    
    var buttonMatrix: [[GameButton]] = [[]]
    let functionHandler = TicTacToeBrain()
    var ohTurn: Bool = false
    var gameOver: Bool = false
    var vsComputer: Bool = false
    var xWins: Int = 0
    var oWins: Int = 0
    var playerWins: Int = 0
    var computerTriumphs: Int = 0
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    buttonMatrix = [[topLeft, topMid, topRight], [midLeft, midMid, midRight], [bottomLeft, bottomMid, bottomRight]]
    functionHandler.resetToNothing(buttonMatrix)
    functionHandler.setRowsAndColumns(buttonMatrix)
    newGameButton.titleLabel?.text = "New Two Player Game"
    newGameComputer.titleLabel?.text = "New Game Vs The Computer"
    turnIndicator.text = "It is X's move."
    xWinsIndicator.text = "Number of X wins: \(xWins)"
    oWinsIndicator.text = "Number of O wins: \(oWins)"
  }

    @IBAction func pressedButton(_ sender: GameButton){
        if vsComputer{
            if !ohTurn && !gameOver {
                turnIndicator.text = "It is the Player's Move."
                functionHandler.exe(sender)
                ohTurn = functionHandler.switchTurn(ohTurn)
                gameOver  = functionHandler.didSomeoneWinYet(buttonMatrix, "X")
                
                
                if gameOver{
                    playerWins += 1
                    turnIndicator.text = "You Win!"
                }
                
                if !gameOver {
                    turnIndicator.text = "The computer's move."
                    functionHandler.makeRandomMove(buttonMatrix)
                    ohTurn = functionHandler.switchTurn(ohTurn)
                    gameOver = functionHandler.didSomeoneWinYet(buttonMatrix, "O")
                    
                    if gameOver{
                        computerTriumphs += 1
                        turnIndicator.text = "The Computer Wins"
                    }
                }
                
            }
            xWinsIndicator.text = "Number of Player wins: \(playerWins)"
            oWinsIndicator.text = "Number of Computer wins: \(computerTriumphs)"
        } else{
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
            xWinsIndicator.text = "Number of X wins: \(xWins)"
            oWinsIndicator.text = "Number of O wins: \(oWins)"
        }
        
        if functionHandler.noMovesLeft(buttonMatrix) && !gameOver{
            turnIndicator.text = "Draw"
        }

        
    }
    
    @IBAction func resetTwoPlayerGame(_ sender: UIButton){
        functionHandler.resetToNothing(buttonMatrix)
        ohTurn = false
        gameOver = false
        turnIndicator.text = "It is X's move."
        vsComputer = false
        xWinsIndicator.text = "Number of X wins: \(xWins)"
        oWinsIndicator.text = "Number of O wins: \(oWins)"
        
    }
    
     @IBAction func resetVsComputer(_ sender: UIButton){
        functionHandler.resetToNothing(buttonMatrix)
        ohTurn = false
        gameOver = false
        turnIndicator.text = "It is the player's move."
        vsComputer = true
        xWinsIndicator.text = "Number of Player wins: \(playerWins)"
        oWinsIndicator.text = "Number of Computer wins: \(computerTriumphs)"
    }

}


