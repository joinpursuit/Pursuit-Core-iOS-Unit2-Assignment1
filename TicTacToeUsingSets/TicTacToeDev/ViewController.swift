//
//  ViewController.swift
//  TicTacToeDev
//
//  Created by Jack Wong on 8/1/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playerOneWinLabelCounter: UILabel!
    @IBOutlet weak var playerTwoWinLabelCounter: UILabel!
    @IBOutlet var allBtns: [UIButton]!
    @IBOutlet weak var newGame: UIButton!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    
    @IBOutlet weak var someLabel: UILabel!
    
    var playerOne = player(playerName: "Player One", playerMark: "X")
    var playerTwo = player(playerName: "Player Two", playerMark: "O")
    
    var playerTurn: Int = 0
    
    @IBAction func userMove(_ sender: UIButton) {
        sender.pulsate()
        sender.isEnabled = false
        
        if playerTurn % 2 == 0{
            sender.setTitle("\(playerOne.playerMove(sender.tag))", for: .disabled)
            
            someLabel.text = "Player Two's turn! (O)"
            
            playerTurn += 1
            
            if playerOne.didPlayerWin(){
                someLabel.text = "Player One won!"
                playerOneWinLabelCounter.text = String(playerOne.winCount)
                disableBoard()
                for i in playerOne.winningCombo{
                    if let button = self.view.viewWithTag(i) as? UIButton
                    {
                        button.backgroundColor = UIColor.green
                        button.pulsate()
                        button.flash()
                    }
                }
            }else if !playerOne.didPlayerWin() && playerTurn == 9{
                
                someLabel.text = "Draw!"
                disableBoard()
            }
            
        }else{
            sender.setTitle("\(playerTwo.playerMove(sender.tag))", for: .disabled)
            
            someLabel.text = "Player One's turn! (X)"
            
            playerTurn += 1
            
            if playerTwo.didPlayerWin(){
                someLabel.text = "Player Two won!"
                playerTwoWinLabelCounter.text = String(playerTwo.winCount)
                disableBoard()

                for i in playerTwo.winningCombo{
                    if let button = self.view.viewWithTag(i) as? UIButton
                    {
                        button.backgroundColor = UIColor.green
                        button.pulsate()
                        button.flash()
                    }
                }
                
            }else if !playerTwo.didPlayerWin() && playerTurn == 9{
                someLabel.text = "Draw!"
                disableBoard()
            }
        }
        
    }
    
    @IBAction func newGame(_ sender: Any) {
        for button in allBtns{
            button.backgroundColor = UIColor.lightGray
            button.isEnabled = true
            button.setTitle("", for: .normal)
        }
        playerOne.clearMoves()
        playerTwo.clearMoves()
        
        someLabel.text = "Player One's Turn! (X)"
        
        playerTurn = 0
    }

    func disableBoard(){
        for button in allBtns{
            button.isEnabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCSS(allBtns)
        someLabel.text = "Player One's Turn! (X)"
    }
    
    
}


