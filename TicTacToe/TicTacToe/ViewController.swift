//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    var matrixAllTheButtons:[[UIButton]]!
   var allTheButtons: [UIButton]=[]
    var arrayOfImages = [UIImage]()
    var player1 = UIImage.init(named:"OImage")!
    var player2 = UIImage.init(named:"XImage")!
    var player1Count = 0
    var player2Count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        matrixAllTheButtons = [
            [btn1, btn2, btn3],
            [btn4, btn5, btn6],
            [btn7, btn8, btn9]]
        
        currentPlayer.switchPlayers()
        
    }
 var currentPlayer: Players = .player1
    
  

    func resetButton() {
        for button1 in matrixAllTheButtons {
            for bt in button1 {
                bt.isEnabled = true
              
            }
        }
    }
    
    enum Players {
        case player1
        case player2
        
        mutating func switchPlayers() {
            switch self {
            case .player1:
                self = .player2
            case .player2:
                self = .player1
                
            }
        }
        
    }
    
    
    func gameOver() {
        for button in matrixAllTheButtons {
            for btn in button {
                btn.isEnabled = false
            }
            
        }
    }
    func winningConditionRow1() {
     if btn1.currentImage == btn2.currentImage && btn2.currentImage == btn3.currentImage {
        gameOver()
        }
    }


    var playerTurn = Players.player1
    
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func allButtons(_ sender: UIButton) {
    
        
        switch currentPlayer {
        case .player1 :
            if sender.isEnabled == true {
                sender.setImage(UIImage.init(named:"OImage"), for: .normal)
                sender.isEnabled = false
    }
               player1Count += 1
                player1Label.text = "Turn: player 1 (\(player1Count))"
               
    
        case .player2 :
            if sender.isEnabled == true {
                sender.setImage(UIImage.init(named:"XImage"), for: .normal)
                sender.isEnabled = false
               }
            player2Count += 1
            player2Label.text = "Turn: player 2 (\(player2Count))"
            
            playerTurn.switchPlayers()
            playButton.titleLabel!.text = "You win! Click to play again"
            
      }
    }
    
    
    
    
    
    
    

 
        
        
    }
   
   
    

   
    



