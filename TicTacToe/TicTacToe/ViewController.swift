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
    
    let ticTacToe = TicTacToeBrain(board: [[String]](repeating: [String](repeating: "_", count: 3), count: 3), rWin: nil, cWin: nil, typeWin: nil)
    var player = "X"
    let xImage = UIImage(systemName: "xmark")
    let oImage = UIImage(systemName: "circle")

    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        //set all buttons to not have an image
        for gameButton in gameButtons {
            gameButton.setBackgroundImage(nil, for: .normal)
        }
    }
    
    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        gameButton.isEnabled = false
        ticTacToe.board[gameButton.row][gameButton.col] = player
        ticTacToe.printBoard()
        if player == "X"{
            gameButton.setBackgroundImage(xImage, for: .normal)
            player = "O"
        } else if player == "O" {
            gameButton.setBackgroundImage(oImage, for: .normal)
            player = "X"
        }
        
        
        if ticTacToe.checkForWin(player: "X"){
            ticTacToe.winDetected(player: "X", arrButtons: gameButtons, uiLabel: userFeedBack)
        }else if(ticTacToe.checkForWin(player: "O")) {
            ticTacToe.winDetected(player: "O", arrButtons: gameButtons, uiLabel: userFeedBack)
            //If board is filled, game is over.
        }else if(ticTacToe.checkBoardFilled()) {
            ticTacToe.boardFilled(uiLabel: userFeedBack)
            //If board not filled and no winning conditions, next user goes.
        }
        else {
            ticTacToe.switchPlayer(player1: player)
        }
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        
    }
    
}

