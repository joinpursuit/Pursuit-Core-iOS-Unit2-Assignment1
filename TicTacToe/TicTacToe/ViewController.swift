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
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    
    var buttonMatrix: [[GameButton]] = [[]]
    let functionHandler = TicTacToeBrain()
    var ohTurn: Bool = false
    var gameOver: Bool = false
    var vsComputer: Bool = false
    var xWins: Int = 0
    var oWins: Int = 0
    var playerWins: Int = 0
    var computerTriumphs: Int = 0
    var options: Int = 0
    var userChoice: String = ""
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    buttonMatrix = [[topLeft, topMid, topRight], [midLeft, midMid, midRight], [bottomLeft, bottomMid, bottomRight]]
    functionHandler.startGame(buttonMatrix)
    functionHandler.setRowsAndColumns(buttonMatrix)
    functionHandler.disable(buttonMatrix)
    newGameButton.titleLabel?.text = "New Two Player Game"
    newGameComputer.titleLabel?.text = "New Game Vs The Computer"
    turnIndicator.text = ""
    xWinsIndicator.text = "Number of X wins: \(xWins)"
    oWinsIndicator.text = "Number of O wins: \(oWins)"
    option1.isHidden = true
    option1.isUserInteractionEnabled = false
    option2.isHidden = true
    option2.isUserInteractionEnabled = false
  }

    @IBAction func pressedButton(_ sender: GameButton){
        if vsComputer{
            if !ohTurn && !gameOver {
                turnIndicator.text = "It is the Computer's Move."
                if userChoice == "X"{
                functionHandler.exe(sender)
                gameOver  = functionHandler.didSomeoneWinYet(buttonMatrix, "X")
                } else if userChoice == "O"{
                    functionHandler.oh(sender)
                    gameOver  = functionHandler.didSomeoneWinYet(buttonMatrix, "O")
                }
                ohTurn = functionHandler.switchTurn(ohTurn)
                
                
                
                if gameOver{
                    playerWins += 1
                    turnIndicator.text = "You Win!"
                }
                
                if !gameOver {
                    turnIndicator.text = "It is the Player's move."
                    if userChoice == "X"{
                        functionHandler.makeRandomMove(buttonMatrix, "O")
                        gameOver  = functionHandler.didSomeoneWinYet(buttonMatrix, "O")
                    } else if userChoice == "O"{
                        functionHandler.makeRandomMove(buttonMatrix, "X")
                        gameOver  = functionHandler.didSomeoneWinYet(buttonMatrix, "X")
                    }
                    ohTurn = functionHandler.switchTurn(ohTurn)
                    
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
        functionHandler.startGame(buttonMatrix)
        ohTurn = false
        gameOver = false
        turnIndicator.text = "It is X's move."
        vsComputer = false
        xWinsIndicator.text = "Number of X wins: \(xWins)"
        oWinsIndicator.text = "Number of O wins: \(oWins)"
        
    }
    
     @IBAction func resetVsComputer(_ sender: UIButton){
    functionHandler.disable(buttonMatrix)
        option1.isUserInteractionEnabled = true
        option1.isHidden = false
        option2.isUserInteractionEnabled = true
        option2.isHidden = false
        gameOver = false
        turnIndicator.text = "Who goes first?"
        vsComputer = true
        option1.setTitle("Player", for: .normal)
        option2.setTitle("Computer", for: .normal)
        xWinsIndicator.text = "Number of Player wins: \(playerWins)"
        oWinsIndicator.text = "Number of Computer wins: \(computerTriumphs)"
        options = 0
        
    }
    
    @IBAction func option1Function(_ sender: UIButton){
        
        switch options{
        case 0:
            ohTurn = false
            turnIndicator.text = "Would you like to be X or O?"
            option1.setTitle("X", for: .normal)
            option2.setTitle("O", for: .normal)
            options += 1
        case 1:
            userChoice = "X"
            option1.isUserInteractionEnabled = false
            option1.isHidden = true
            option2.isUserInteractionEnabled = false
            option2.isHidden = true
            functionHandler.startGame(buttonMatrix)
            if !ohTurn{
                turnIndicator.text = "It is the Player's move."
            } else {
                turnIndicator.text = "It is the Computer's move."
                    if userChoice == "X"{
                        functionHandler.makeRandomMove(buttonMatrix, "O")
                        gameOver = functionHandler.didSomeoneWinYet(buttonMatrix, "O")
                    } else if userChoice == "O"{
                        functionHandler.makeRandomMove(buttonMatrix,"X")
                        gameOver = functionHandler.didSomeoneWinYet(buttonMatrix, "X")
                    }
                ohTurn = functionHandler.switchTurn(ohTurn)
                
                
                if gameOver{
                    computerTriumphs += 1
                    turnIndicator.text = "The Computer Wins"
                    }
            }
        default:
            break
        }
        
    }
    
    @IBAction func option2Function(_ sender: UIButton){
        switch options{
        case 0:
            ohTurn = true
            turnIndicator.text = "Would you like to be X or O?"
            option1.setTitle("X", for: .normal)
            option2.setTitle("O", for: .normal)
            options += 1
        case 1:
            userChoice = "O"
            option1.isUserInteractionEnabled = false
            option1.isHidden = true
            option2.isUserInteractionEnabled = false
            option2.isHidden = true
            functionHandler.startGame(buttonMatrix)
            if ohTurn{
            turnIndicator.text = "It is the Computer's move."
                if userChoice == "X"{
                    functionHandler.makeRandomMove(buttonMatrix, "O")
                    gameOver = functionHandler.didSomeoneWinYet(buttonMatrix, "O")
                } else if userChoice == "O"{
                    functionHandler.makeRandomMove(buttonMatrix,"X")
                    gameOver = functionHandler.didSomeoneWinYet(buttonMatrix, "X")
                }
            ohTurn = functionHandler.switchTurn(ohTurn)
            
            
            if gameOver{
                computerTriumphs += 1
                turnIndicator.text = "The Computer Wins"
                }
            } else {
                turnIndicator.text = "It is the Player's move."
            }
            default:
            break
        }
        
    }

}


