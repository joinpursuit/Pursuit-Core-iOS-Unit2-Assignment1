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
    @IBOutlet weak var PlayerTurnMessageLabel: UILabel!
    
//    var playerX = Players.playerX
//    var playerO = Players.PlayerO
    var turn:Int = 0
    let X:String = "\u{274C}"
    let O:String = "\u{2B55}"
    var board:[String] = Array(repeating: " ", count: 9)
    var gameHasWinner:Bool = false
    
    let winCombinations = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
    ]
    
    func gameStatus() {
        for winCombination in winCombinations {
            let winIndexOne = winCombination[0]
            let winIndexTwo = winCombination[1]
            let winIndexThree = winCombination[2]
            
            //board[winIndexNumber] looks at index that winIndexNumber represents in the  board array based on the current winning combination, i.e the array that is looping through
            let positionOne = board[winIndexOne]
            let positionTwo = board[winIndexTwo]
            let positionThree = board[winIndexThree]
        
            if positionOne == X && positionTwo == X && positionThree == X {
                PlayerTurnMessageLabel.text = "Winner is \(X)"
                disableButtons()
                gameHasWinner = true
            } else if positionOne == O && positionTwo == O && positionThree == O {
                PlayerTurnMessageLabel.text = "Winner is \(O)"
                disableButtons()
                gameHasWinner = true
            }
        }
    }
    
    private func boardIsFull() -> Bool {
        for index in board where index == " " {
            return false
        }
        return true
    }
    
    
    @IBAction func gameController(_ sender: UIButton) {
        if turn % 2 == 0 {
            sender.setTitle(X, for: .normal)
            board[sender.tag-1] = X
            playerTurnMessage(turn: turn)
        } else {
            sender.setTitle(O, for: .normal)
            board[sender.tag-1] = O
            playerTurnMessage(turn: turn)
        }
        gameStatus()
        turn += 1
        sender.isEnabled = false
        
        if boardIsFull() && !gameHasWinner {
            PlayerTurnMessageLabel.text = "Cat's game"
            disableButtons()
        }
    }
    
    
    @IBAction func endGameButton(_ sender: UIButton) {
        restartGame()
    }
    

 
    private func enableButtons() -> Void {
        buttonOne.isEnabled = true
        ButtonTwo.isEnabled = true
        buttonThree.isEnabled = true
        buttonFour.isEnabled = true
        buttonFive.isEnabled = true
        buttonSix.isEnabled = true
        buttonSeven.isEnabled = true
        buttonEight.isEnabled = true
        buttonNine.isEnabled = true
    }
    
    private func disableButtons() -> Void {
        buttonOne.isEnabled = false
        ButtonTwo.isEnabled = false
        buttonThree.isEnabled = false
        buttonFour.isEnabled = false
        buttonFive.isEnabled = false
        buttonSix.isEnabled = false
        buttonSeven.isEnabled = false
        buttonEight.isEnabled = false
        buttonNine.isEnabled = false
    }
    
    
    private func resetButtons() -> Void {
        buttonOne.setTitle("", for: .normal)
        ButtonTwo.setTitle("", for: .normal)
        buttonThree.setTitle("", for: .normal)
        buttonFour.setTitle("", for: .normal)
        buttonFive.setTitle("", for: .normal)
        buttonSix.setTitle("", for: .normal)
        buttonSeven.setTitle("", for: .normal)
        buttonEight.setTitle("", for: .normal)
        buttonNine.setTitle("", for: .normal)
    }
    
    private func restartGame() -> Void {
        resetButtons()
        enableButtons()
        board = Array(repeating: " ", count: 9)
        turn = 0
        gameHasWinner = false
        PlayerTurnMessageLabel.text = "Player One's Turn"
    }

    
    private func playerTurnMessage(turn: Int) -> Void {
        if turn % 2 == 0 {
            PlayerTurnMessageLabel.text = "Player Two's Turn"
        } else {
            PlayerTurnMessageLabel.text = "Player One's Turn"
        }
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartGame()
    // Do any additional setup after loading the view, typically from a nib.
  }
}

