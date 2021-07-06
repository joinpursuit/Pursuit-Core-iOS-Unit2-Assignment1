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
    @IBOutlet weak var endScreen: UIView!
    @IBOutlet weak var restartGame: UIButton!
    @IBOutlet weak var winner: UILabel!
    
    


    
  override func viewDidLoad() {
    super.viewDidLoad()
    restartGame.isHidden = true
    endScreen.isHidden = true
    winner.isHidden = true
    textWinner.text = "Player One"
    playerOneWinCount.text = "Player One Score: \(TicTacToeBrain.playerOneWinCount)"
    playerTwoWinCount.text = "Player Two Score: \(TicTacToeBrain.playerTwoWinCount)"
  }
    @IBAction func buttonAction(_ sender: GameButton) {
        
            if TicTacToeBrain.turn == 1 {
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
                for button in buttons {
                    button.isEnabled = false
                }
                TicTacToeBrain.playerOneWinCount += 1
                playerOneWinCount.text = "Player One Score: \(TicTacToeBrain.playerOneWinCount)"
                restartGame.isHidden = false
                endScreen.isHidden = false
                winner.isHidden = false
                winner.text = "Player One is the winner"
                winner.textColor = #colorLiteral(red: 0.995932281, green: 0.2765177786, blue: 0.3620784283, alpha: 1)
                break
            } else if result == 12 {
                for button in buttons {
                    button.isEnabled = false
                }
                TicTacToeBrain.playerTwoWinCount += 1
                playerTwoWinCount.text = "Player Two Score: \(TicTacToeBrain.playerTwoWinCount)"
                restartGame.isHidden = false
                endScreen.isHidden = false
                winner.isHidden = false
                winner.textColor = #colorLiteral(red: 0.2221263647, green: 0.5435168147, blue: 1, alpha: 1)
                winner.text = "Player Two is the winner"
                break
            } else if TicTacToeBrain.count == 9 {
                
                for button in buttons {
                    button.isEnabled = false
                }
                restartGame.isHidden = false
                endScreen.isHidden = false
                winner.isHidden = false
                winner.text = "Draw"
                winner.textColor = .white
                
            }
            
        }

    }
    @IBAction func restart(_ sender: UIButton) {
        buttons.forEach{$0.isUserInteractionEnabled = true}
        buttons.forEach{$0.isEnabled = true}
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
        restartGame.isHidden = true
        endScreen.isHidden = true
        }
    
    
}

