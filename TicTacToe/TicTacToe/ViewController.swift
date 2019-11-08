//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {

    @IBOutlet var gameButtons: [GameButton]!
    @IBOutlet weak var userFeedBack: UILabel!
    
    
    let ticTacToe = TicTacToeBrain(board: [[String]](repeating: [String](repeating: "_", count: 3), count: 3), rWin: nil, cWin: nil, typeWin: nil, player: "X")
    //var player = "X"
    let xImage = UIImage(systemName: "xmark")
    let oImage = UIImage(systemName: "circle")
    
    var playerXScore = 0
    var playerYScore = 0

    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        //set all buttons to not have an image
        for gameButton in gameButtons {
            gameButton.setBackgroundImage(nil, for: .normal)
        }
        
        userFeedBack.text = "Tic-Tac-Toe"
    }
    
    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        let player = ticTacToe.player
        
        gameButton.isEnabled = false
        ticTacToe.board[gameButton.row][gameButton.col] = player
        ticTacToe.printBoard()
        //If board not filled and no winning conditions, next user goes.
        if player == "X"{
            gameButton.setBackgroundImage(xImage, for: .normal)
            ticTacToe.switchPlayer(player1: player)//player = "O"
        } else if player == "O" {
            gameButton.setBackgroundImage(oImage, for: .normal)
            ticTacToe.switchPlayer(player1: ticTacToe.player)
        }
        
        if ticTacToe.checkForWin(player: "X"){
            ticTacToe.winDetected(player: "X", arrButtons: gameButtons, uiLabel: userFeedBack)
            playerXScore += 1
            userFeedBack.text?.append(contentsOf: "\nPlayer X score: \(playerXScore) \nPlayer O score: \(playerYScore)")
        }else if(ticTacToe.checkForWin(player: "O")) {
            ticTacToe.winDetected(player: "O", arrButtons: gameButtons, uiLabel: userFeedBack)
            //If board is filled, game is over.
            playerYScore += 1
            userFeedBack.text?.append(contentsOf: "Player X score: \(playerXScore), Player O score: \(playerYScore)")
        }else if(ticTacToe.checkBoardFilled()) {
            ticTacToe.boardFilled(uiLabel: userFeedBack)
        }
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        for gameButton in gameButtons {
            gameButton.setBackgroundImage(nil, for: .normal)
            gameButton.isEnabled = true
        }
//        playerXScore = 0
//        playerYScore = 0
        userFeedBack.text = "Tic-Tac-Toe"
        ticTacToe.resetBoard()
    }
    
}

