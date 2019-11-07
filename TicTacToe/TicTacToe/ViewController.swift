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
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
    
        @IBAction func buttonPress(_ sender: GameButton) {
        
            switch sender.tag   {
            case 0:
                if gameBrain.turn % 2 == 1  {
                    button1.setTitle("X", for: selected)
                    gameBrain.board[0] = [0]
                }
                else if gameBrain.turn % 2 == 0 {
                    button1.setTitle("O", for: selected)
                    gameBrain.board[0] = [1]
                }
                button1.isEnabled = false
                print(button1.col)
                
            case 1:
                if gameBrain.turn % 2 == 1  {
                    button2.setTitle("X", for: selected)
                    gameBrain.board[1] = [0]
                }
                else if gameBrain.turn % 2 == 0 {
                    button2.setTitle("O", for: selected)
                    gameBrain.board[1] = [1]
                }
                button2.isEnabled = false
            case 2:
                if gameBrain.turn % 2 == 1  {
                    button3.setTitle("X", for: selected)
                    gameBrain.board[2] = [0]
                }
                else if gameBrain.turn % 2 == 0 {
                    button3.setTitle("O", for: selected)
                    gameBrain.board[2] = [1]
                }
                button3.isEnabled = false
            case 3:
                if gameBrain.turn % 2 == 1  {
                    button4.setTitle("X", for: selected)
                    gameBrain.board[3] = [0]
                }
                else if gameBrain.turn % 2 == 0 {
                    button4.setTitle("O", for: selected)
                    gameBrain.board[3] = [1]
                }
                button4.isEnabled = false
                print(button4.col)
            case 4:
                if gameBrain.turn % 2 == 1  {
                    button5.setTitle("X", for: selected)
                    gameBrain.board[4] = [0]
                }
                else if gameBrain.turn % 2 == 0 {
                    button5.setTitle("O", for: selected)
                    gameBrain.board[4] = [1]
                }
                button5.isEnabled = false
            case 5:
                if gameBrain.turn % 2 == 1  {
                    button6.setTitle("X", for: selected)
                    gameBrain.board[5] = [0]
                }
                else if gameBrain.turn % 2 == 0 {
                    button6.setTitle("O", for: selected)
                    gameBrain.board[5] = [1]
                }
                button6.isEnabled = false
            case 6:
                if gameBrain.turn % 2 == 1  {
                    button7.setTitle("X", for: selected)
                    gameBrain.board[6] = [0]
                }
                else if gameBrain.turn % 2 == 0 {
                    button7.setTitle("O", for: selected)
                    gameBrain.board[6] = [1]
                }
                button7.isEnabled = false
            case 7:
                if gameBrain.turn % 2 == 1  {
                    button8.setTitle("X", for: selected)
                    gameBrain.board[7] = [0]
                }
                else if gameBrain.turn % 2 == 0 {
                    button8.setTitle("O", for: selected)
                    gameBrain.board[7] = [1]
                }
                button8.isEnabled = false
            case 8:
                if gameBrain.turn % 2 == 1  {
                    button9.setTitle("X", for: selected)
                    gameBrain.board[8] = [0]
                }
                else if gameBrain.turn % 2 == 0 {
                    button9.setTitle("O", for: selected)
                    gameBrain.board[8] = [1]
                }
                button9.isEnabled = false
                
            default:
                print("ERROR")
            }
            
            gameBrain.turn += 1
    }
    
}

