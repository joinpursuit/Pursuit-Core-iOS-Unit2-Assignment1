//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [GameButton]!
    @IBOutlet weak var textWinner: UILabel!
    @IBOutlet weak var playerOneWinCount: UILabel!
    
    @IBOutlet weak var playerTwoWinCount: UILabel!
    
    


    
  override func viewDidLoad() {
    super.viewDidLoad()
    textWinner.text = "Player One"
    playerOneWinCount.text = "Player One Wins: \(TicTacToeBrain.playerOneWinCount)"
    playerTwoWinCount.text = "Player Two Wins: \(TicTacToeBrain.playerTwoWinCount)"
  }
    @IBAction func buttonAction(_ sender: GameButton) {
        
            if TicTacToeBrain.turn == 1 {
//                sender.setImage(UIImage.init(named: "x"), for: .normal)
                sender.setTitle("X", for: .normal)
                sender.backgroundColor = #colorLiteral(red: 0.995932281, green: 0.2765177786, blue: 0.3620784283, alpha: 1)
                TicTacToeBrain.board[sender.row][sender.col] = 1
                sender.isUserInteractionEnabled = false
                textWinner.text = "Player Two"
                
                TicTacToeBrain.turn = 2
                TicTacToeBrain.count += 1
            } else {
//                sender.setImage(UIImage.init(named: "o"), for: .normal)
                sender.setTitle("O", for: .normal)
                sender.backgroundColor = #colorLiteral(red: 0.2221263647, green: 0.5435168147, blue: 1, alpha: 1)
                TicTacToeBrain.board[sender.row][sender.col] = 4
                textWinner.text = "Player One"
                
                sender.isUserInteractionEnabled = false
                TicTacToeBrain.turn = 1
                TicTacToeBrain.count += 1
                
        }
        let winnerCombos = [[TicTacToeBrain.board[0][0],TicTacToeBrain.board[0][1], TicTacToeBrain.board[0][2]],
                           [TicTacToeBrain.board[1][0],TicTacToeBrain.board[1][1], TicTacToeBrain.board[1][2]],[TicTacToeBrain.board[2][0],TicTacToeBrain.board[2][1], TicTacToeBrain.board[2][2]],
                           [TicTacToeBrain.board[0][0],TicTacToeBrain.board[1][0], TicTacToeBrain.board[2][0]],
                           [TicTacToeBrain.board[0][1],TicTacToeBrain.board[1][1], TicTacToeBrain.board[2][1]],
                           [TicTacToeBrain.board[0][2],TicTacToeBrain.board[1][2], TicTacToeBrain.board[2][2]],
                           [TicTacToeBrain.board[0][0],TicTacToeBrain.board[1][1], TicTacToeBrain.board[2][2]],
                           [TicTacToeBrain.board[2][0],TicTacToeBrain.board[1][1], TicTacToeBrain.board[0][2]]]
        
        for index in 0...winnerCombos.count - 1 {
            let result = winnerCombos[index].reduce(0){$0 + $1}
            if result == 3 {
                textWinner.text = "Player one is the winner"
                for button in buttons {
                    button.isEnabled = false
                }
                TicTacToeBrain.playerOneWinCount += 1
                playerOneWinCount.text = "Player One Wins: \(TicTacToeBrain.playerOneWinCount)"
                break
            } else if result == 12 {
                textWinner.text = "Player two is the winner"
                for button in buttons {
                    button.isEnabled = false
                }
                TicTacToeBrain.playerTwoWinCount += 1
                playerTwoWinCount.text = "Player Two Wins: \(TicTacToeBrain.playerTwoWinCount)"
                break
            } else if TicTacToeBrain.count == 9 {
                
                textWinner.text = "Draw"
                for button in buttons {
                    button.isEnabled = false
                }
            }
            
        }

    }
    @IBAction func restart(_ sender: UIButton) {
        buttons.forEach{$0.isUserInteractionEnabled = true}
        buttons.forEach{$0.isEnabled = true}
//        buttons.forEach{$0.setImage(UIImage(named: "Default Image"), for: .normal)}
        buttons.forEach{$0.setTitle("", for: .normal)}
        buttons.forEach{$0.backgroundColor = .white}
        TicTacToeBrain.turn = 1
        TicTacToeBrain.count = 0
        textWinner.text = ""
        for index in 0...TicTacToeBrain.board.count - 1 {
            for num in 0...TicTacToeBrain.board[index].count - 1 {
                TicTacToeBrain.board[index][num] = 0
                
            }
        }
        }
    
    
}

