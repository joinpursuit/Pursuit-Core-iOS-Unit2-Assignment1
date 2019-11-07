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
                }
                else if gameBrain.turn % 2 == 0 {
                    button1.setTitle("O", for: selected)
                }
            case 1:
                if gameBrain.turn % 2 == 1  {
                    button2.setTitle("X", for: selected)
                }
                else if gameBrain.turn % 2 == 0 {
                    button2.setTitle("O", for: selected)
                }
            case 2:
            if gameBrain.turn % 2 == 1  {
                button3.setTitle("X", for: selected)
            }
            else if gameBrain.turn % 2 == 0 {
                button3.setTitle("O", for: selected)
            }
            case 3:
            if gameBrain.turn % 2 == 1  {
                button4.setTitle("X", for: selected)
            }
            else if gameBrain.turn % 2 == 0 {
                button4.setTitle("O", for: selected)
            }
            case 4:
            if gameBrain.turn % 2 == 1  {
                button5.setTitle("X", for: selected)
            }
            else if gameBrain.turn % 2 == 0 {
                button5.setTitle("O", for: selected)
            }
            case 5:
            if gameBrain.turn % 2 == 1  {
                button6.setTitle("X", for: selected)
            }
            else if gameBrain.turn % 2 == 0 {
                button6.setTitle("O", for: selected)
            }
            case 6:
            if gameBrain.turn % 2 == 1  {
                button7.setTitle("X", for: selected)
            }
            else if gameBrain.turn % 2 == 0 {
                button7.setTitle("O", for: selected)
            }
            case 7:
            if gameBrain.turn % 2 == 1  {
                button8.setTitle("X", for: selected)
            }
            else if gameBrain.turn % 2 == 0 {
                button8.setTitle("O", for: selected)
            }
            case 8:
            if gameBrain.turn % 2 == 1  {
                button9.setTitle("X", for: selected)
            }
            else if gameBrain.turn % 2 == 0 {
                button9.setTitle("O", for: selected)
            }
                
            default:
                print("ERROR")
            }
            gameBrain.turn += 1
    }
    
}

