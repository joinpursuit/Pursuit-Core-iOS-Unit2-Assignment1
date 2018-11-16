//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentPlayer = 1
    var currentGameState = [0,0,0,0,0,0,0,0,0]
    var activeGame = true
    let winningNumbers = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet weak var whoWon: UILabel!
    
    
    @IBAction func Buttons(_ sender: UIButton!) {
    
        if (currentGameState[sender.tag] == 0 && activeGame == true ) {
            
            (currentGameState[sender.tag] = currentPlayer)
            
        if currentPlayer == 1 {
            sender.setImage(UIImage(named: "Xs.png"), for: .normal)
            currentPlayer = 2
        } else {
            
            sender.setImage(UIImage(named: "Os.png"), for: .normal)
            currentPlayer = 1
        }
    
    }
    
        
        
        for numbers in winningNumbers {
            if currentGameState[numbers[0]] != 0 && currentGameState[numbers[0]] == currentGameState[numbers[1]] && currentGameState[numbers[1]] == currentGameState[numbers[2]] {
                
                activeGame = false
                
                
                if currentGameState[numbers[0]] == 1 {
                    whoWon.text = "X is victorious"
                } else {
                    whoWon.text = "O is victorious"
                }
            }
            activeGame = false
            
            for i in currentGameState {
                if i == 0 {
                    activeGame = true
                    break
                }
            }
            if activeGame == false {
                whoWon.text = "No one is victorious"
            }
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    
    @IBAction func playAgain(_ sender: UIButton) {
    
    currentGameState = [0,0,0,0,0,0,0,0,0]
     activeGame = true
    currentPlayer = 1
        
    
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton!
            button?.setImage(nil, for: .normal)
        }
    
    }
    
}
