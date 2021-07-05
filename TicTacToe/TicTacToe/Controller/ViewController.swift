//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

var playerOneTurn = true
var gameRunning = true
var turnCount = 0
var playerXScore = 0
var playerOScore = 0
var xPlayerRowArray = [Int]()
var xPlayerColArray = [Int]()
var oPlayerRowArray = [Int]()
var oPlayerColArray = [Int]()



class ViewController: UIViewController {

   
    @IBOutlet var allButtons : [GameButton]!
    
    @IBOutlet var gameText : UILabel!
    
    @IBOutlet var scoreCount : UITextView!
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        // turn into function
        if playerOneTurn{
        gameText.text = "Player One's Turn"
        }else{
            gameText.text = "Player Two's Turn"
        }
        
        allButtons.forEach { $0.setImage(UIImage(named: "Default Image"), for: .normal)}
  }
   
    
    @IBAction func setXorO (_ square: GameButton) {
        
        
        if playerOneTurn{
            gameText.text = "Player Two's Turn"
        }else{
            gameText.text = "Player One's Turn"
        }
        
        if playerOneTurn{
            allButtons[square.tag].setImage(UIImage.init(named: "O"), for: .normal)
            allButtons[square.tag].isEnabled = false
            oPlayerColArray.append(square.col)
            oPlayerRowArray.append(square.row)
            turnCount += 1
            playerOneTurn = !playerOneTurn
            
        }else{
            allButtons[square.tag].setImage(UIImage.init(named: "X"), for: .normal)
            allButtons[square.tag].isEnabled = false
            xPlayerColArray.append(square.col)
            xPlayerRowArray.append(square.row)
            turnCount += 1
            playerOneTurn = !playerOneTurn
            
        }
    }
    
    @IBAction func winCondition(_ checks: GameButton) {
        var checkXRow = [Int]()
        var checkXCol = [Int]()
        var checkORow = [Int]()
        var checkOCol = [Int]()
        // Win is possible on turn 9, make. leave draw as defualt final condition
       
        for i in 1...3{
           checkXRow = xPlayerRowArray.filter {$0 == i}
           checkXCol = xPlayerColArray.filter {$0 == i}
           checkORow = oPlayerRowArray.filter {$0 == i}
           checkOCol = oPlayerColArray.filter {$0 == i}

            if checkXRow.count == 3 {
                gameText.text = "X win"
                playerXScore += 1
                allButtons.forEach  {$0.isEnabled = false}
            }else if checkXCol.count == 3 {
                gameText.text = "X wins"
                playerXScore += 1
                allButtons.forEach  {$0.isEnabled = false}
            }else if checkOCol.count == 3 {
                gameText.text = "O win"
                playerOScore += 1
                allButtons.forEach  {$0.isEnabled = false}
            }else if checkORow.count == 3 {
                gameText.text = "O win"
                playerOScore += 1
                allButtons.forEach  {$0.isEnabled = false}
            }else if turnCount == 9 {
                gameText.text = "Draw"
            }
        }
        
    }
    
    @IBAction func reset (_ newGame: UIButton){
        allButtons.forEach  {$0.isEnabled = true}
        allButtons.forEach { $0.setImage(UIImage(named: "Default Image"), for: .normal)}
        turnCount = 0
        xPlayerColArray.removeAll()
        xPlayerRowArray.removeAll()
        oPlayerColArray.removeAll()
        oPlayerRowArray.removeAll()
        gameText.text = "Board Reset"
        scoreCount.text = "Player X:\(playerXScore) Player O:\(playerOScore)"
        }
    }



