//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
  let player1Turn: Bool = true
    
    var gameRunning = true
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2],[0,3,6],[3,4,5],[6,7,8],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet weak var label: UILabel!
    @IBAction func Action(_ sender: UIButton)
    {
        if (gameState[sender.tag-0] == 0 && gameRunning == true)
        {
            gameState[sender.tag-0] = activePlayer
    
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: TicTacToeImageName.X ),for: .normal)
                activePlayer = 2
                sender.isEnabled = false
            }else {
                sender.setImage(UIImage(named:TicTacToeImageName.O ),for: .normal)
                activePlayer = 1
                sender.isEnabled = false
            }
        }
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                
                gameRunning = false
                if gameState[combination[0]] == 1 {
                    label.text = "You dont have the answers Sway!!!!"
                }else{
                    label.text = " I told her dont wear no 350s round me."
        }
                playAgain.isHidden = false
                label.isHidden = false
                 allButtons.forEach {$0.isEnabled = false}
}
            gameRunning = false
            
            for i in gameState{
                if i == 0 {
                    gameRunning = true
                    break
                }
            }
            if gameRunning == false {
                label.text = " Draw"
                label.isHidden = false
                playAgain.isHidden = false
            }
           
}
        
}
    @IBOutlet weak var playAgain: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameRunning = true
        activePlayer = 1
        playAgain.isHidden = false
        label.isHidden = false
        allButtons.forEach {$0.isEnabled = true}
        allButtons.forEach {$0.setImage(UIImage.init(named: "Default Image"), for: .normal)}
        label.text = "Player 1 Begin"
        

    }
}
