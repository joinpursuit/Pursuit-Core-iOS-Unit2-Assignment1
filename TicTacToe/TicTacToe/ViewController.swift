//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameBrain = TicTacToeBrain()
    
    var selected = UIControl.State.normal
    
    @IBOutlet weak var button1: GameButton!
    @IBOutlet weak var button2: GameButton!
    @IBOutlet weak var button3: GameButton!
    @IBOutlet weak var button4: GameButton!
    @IBOutlet weak var button5: GameButton!
    @IBOutlet weak var button6: GameButton!
    @IBOutlet weak var button7: GameButton!
    @IBOutlet weak var button8: GameButton!
    @IBOutlet weak var button9: GameButton!
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var p1Wins: UILabel!
    @IBOutlet weak var p2Wins: UILabel!
    
    func turnOff()  {
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        button5.isEnabled = false
        button6.isEnabled = false
        button7.isEnabled = false
        button8.isEnabled = false
        button9.isEnabled = false
    }
    
    func turnOn()  {
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true
        button5.isEnabled = true
        button6.isEnabled = true
        button7.isEnabled = true
        button8.isEnabled = true
        button9.isEnabled = true
    }
    
    func newGame()  {
        turnOn()
        button1.setTitle("", for: selected)
        button2.setTitle("", for: selected)
        button3.setTitle("", for: selected)
        button4.setTitle("", for: selected)
        button5.setTitle("", for: selected)
        button6.setTitle("", for: selected)
        button7.setTitle("", for: selected)
        button8.setTitle("", for: selected)
        button9.setTitle("", for: selected)
        winner.text = "Winner:"
        for num in 0...(gameBrain.board.count - 1) {
            gameBrain.board[num] = gameBrain.empty
        }
        gameBrain.winner = false
        gameBrain.turn = 1
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
    
        @IBAction func buttonPress(_ sender: GameButton) {
        
            switch sender.tag   {
            case 0:
                if gameBrain.turn % 2 == 1  {
                    button1.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button1.setTitle("O", for: selected)
                }
                button1.isEnabled = false
            case 1:
                if gameBrain.turn % 2 == 1  {
                    button2.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button2.setTitle("O", for: selected)
                }
                button2.isEnabled = false
            case 2:
                if gameBrain.turn % 2 == 1  {
                    button3.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button3.setTitle("O", for: selected)
                }
                button3.isEnabled = false
            case 3:
                if gameBrain.turn % 2 == 1  {
                    button4.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button4.setTitle("O", for: selected)
                }
                button4.isEnabled = false
            case 4:
                if gameBrain.turn % 2 == 1  {
                    button5.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button5.setTitle("O", for: selected)
                }
                button5.isEnabled = false
            case 5:
                if gameBrain.turn % 2 == 1  {
                    button6.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button6.setTitle("O", for: selected)
                }
                button6.isEnabled = false
            case 6:
                if gameBrain.turn % 2 == 1  {
                    button7.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button7.setTitle("O", for: selected)
                }
                button7.isEnabled = false
            case 7:
                if gameBrain.turn % 2 == 1  {
                    button8.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button8.setTitle("O", for: selected)
                }
                button8.isEnabled = false
            case 8:
                if gameBrain.turn % 2 == 1  {
                    button9.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button9.setTitle("O", for: selected)
                }
                button9.isEnabled = false
                
            default:
                print("ERROR")
            }
            
            gameBrain.board[sender.tag] = gameBrain.turn % 2
            for combo in gameBrain.winningCombos    {
                if gameBrain.board[combo[0]] == gameBrain.x && gameBrain.board[combo[1]] == gameBrain.x && gameBrain.board[combo[2]] == gameBrain.x   {
                        turnOff()
                        gameBrain.winner = true
                        winner.text = "Winner: X Wins!"
                    gameBrain.player1Score += 1
                    p1Wins.text = "Player 1: \(gameBrain.player1Score)"
                    }
                    else if  gameBrain.board[combo[0]] == gameBrain.o && gameBrain.board[combo[1]] == gameBrain.o && gameBrain.board[combo[2]] == gameBrain.o   {
                        turnOff()
                        gameBrain.winner = true
                    winner.text = "Winner: O Wins!"
                    gameBrain.player2Score += 1
                    p2Wins.text = "Player 2: \(gameBrain.player2Score)"
                    }
            }
            if gameBrain.board.contains(gameBrain.empty) == false && gameBrain.winner == false {
                winner.text = "Winner: Tie!"
            }
            print(gameBrain.board)
            gameBrain.turn += 1
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        newGame()
    }
}

