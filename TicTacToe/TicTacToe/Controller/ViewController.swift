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
            print(oPlayerRowArray)
            print(oPlayerColArray)
            turnCount += 1
            playerOneTurn = !playerOneTurn
            
        }else{
            allButtons[square.tag].setImage(UIImage.init(named: "X"), for: .normal)
            allButtons[square.tag].isEnabled = false
            xPlayerColArray.append(square.col)
            xPlayerRowArray.append(square.row)
            print(xPlayerRowArray)
            print(xPlayerColArray)
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
        if turnCount == 9{
            gameText.text = "Draw"
        }
        for i in 1...3{
           checkXRow = xPlayerRowArray.filter {$0 == i }
           checkXCol = xPlayerColArray.filter {$0 == i }
           checkORow = oPlayerRowArray.filter {$0 == i }
           checkOCol = oPlayerColArray.filter {$0 == i }
        print("\(i)===========")
            print(xPlayerRowArray)
        print("This is Xx \(checkXRow)")
        print("This is Xy \(checkXCol)")
        print("This is Ox \(checkORow)")
        print("This is Oy \(checkOCol)")
            if xPlayerRowArray.count == 3 {
                print("X win")
                
            }
        }
        
    }
    
    @IBAction func reset (_ newGame: UIButton){
        allButtons.forEach  {$0.isEnabled = true}
        allButtons.forEach { $0.setImage(UIImage(named: "Default Image"), for: .normal)
        turnCount = 0
        xPlayerColArray.removeAll()
        xPlayerRowArray.removeAll()
        oPlayerColArray.removeAll()
        oPlayerRowArray.removeAll()
        gameText.text = "Board Reset"
        }
    }
}


