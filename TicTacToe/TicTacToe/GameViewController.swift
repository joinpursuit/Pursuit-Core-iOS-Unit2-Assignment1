//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Jose Alarcon Chacon on 11/9/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var Player1Label: UILabel!
    @IBOutlet weak var Player2Label: UILabel!
    @IBOutlet weak var ButtonState: UIButton!
    @IBOutlet weak var ScoreLabel1: UILabel!
    @IBOutlet weak var ScoreLabel2: UILabel!
    
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    

    @IBAction func PlayAgain(_ sender: UIButton) {
        label.text = "It is player 1's turn"
        numberOfTurns = 0
        enableButton()
        
        setToWhite()
         playDict[0] = 0
         playDict[1] = 0
         playDict[2] = 0
         playDict[3] = 0
         playDict[4] = 0
         playDict[5] = 0
         playDict[6] = 0
         playDict[7] = 0
         playDict[8] = 0
        print(playDict)
    }
    func setToWhite() {
        Button1.setImage(whiteBox, for: .normal)
        Button2.setImage(whiteBox, for: .normal)
        Button3.setImage(whiteBox, for: .normal)
        Button4.setImage(whiteBox, for: .normal)
        Button5.setImage(whiteBox, for: .normal)
        Button6.setImage(whiteBox, for: .normal)
        Button7.setImage(whiteBox, for: .normal)
        Button8.setImage(whiteBox, for: .normal)
        Button9.setImage(whiteBox, for: .normal)
      
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreLabel1.text = "0"
        ScoreLabel2.text = "0"
    }
    
    func enableButton() {
        Button1.isEnabled = true
        Button1.isUserInteractionEnabled = true
        Button2.isEnabled = true
        Button2.isUserInteractionEnabled = true
        Button3.isEnabled = true
        Button3.isUserInteractionEnabled = true
        Button4.isEnabled = true
        Button4.isUserInteractionEnabled = true
        Button5.isEnabled = true
        Button5.isUserInteractionEnabled = true
        Button6.isEnabled = true
        Button6.isUserInteractionEnabled = true
        Button7.isEnabled = true
        Button7.isUserInteractionEnabled = true
        Button8.isEnabled = true
        Button8.isUserInteractionEnabled = true
        Button9.isEnabled = true
        Button9.isUserInteractionEnabled = true
      }
    
    func disableButtons() {
        Button1.isEnabled = false
        Button2.isEnabled = false
        Button3.isEnabled = false
        Button4.isEnabled = false
        Button5.isEnabled = false
        Button6.isEnabled = false
        Button7.isEnabled = false
        Button8.isEnabled = false
        Button9.isEnabled = false
    }
    
    
    let xImage = UIImage(named: "indexX")
    let oImage = UIImage(named: "indexO")
    let image = UIImage(named: "tictactoeboard")
    let whiteBox = UIImage(named: "whitesquare")
    
    var numberOfTurns = 0
    var player1 = 0
    var player2 = 0

    
    
    var playDict: [Int:Int] =
        [0:0, 1:0, 2:0,
         3:0, 4:0, 5:0,
         6:0, 7:0, 8:0]
    
    var winningTuples = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]
    
    func checkForWinner() -> (String) {
        var winner = ""
        for item in winningTuples {
            let first = item.0
            let second = item.1
            let third = item.2
            let firstresult = playDict[first]!
            let secondresult = playDict[second]!
            let thirdresult = playDict[third]!
            let result = firstresult + secondresult + thirdresult
            if result == 3 {
                winner = "Player 1"
                label.text = "Player 1 Won!! 👏🏽👏🏽👏🏽"
                player1 = player1 + 1
                ScoreLabel1.text = " Score: \(player1)"
                break
            } else if result == -3 {
                winner = "Player 2"
                label.text = "Player 2 Won!! 👏🏽👏🏽👏🏽"
                player2 = 1
                ScoreLabel2.text = "Score: \(player2)"
                break
            } else {
                print("No winning yet")
            }
        }
        return winner
    }
    
    @IBAction func TicTacToeButton(_ sender: UIButton) {
        if numberOfTurns % 2 == 0 {
            sender.setImage(xImage, for: .normal)
            let dictKey = sender.tag
            playDict[dictKey] = 1
            label.text = "It is player 2's turn"
            sender.isUserInteractionEnabled = false
        } else  {
            sender.setImage(oImage, for: .normal)
            let dictKey = sender.tag
            playDict[dictKey] = -1
            label.text = "It is player 1's turn"
            sender.isUserInteractionEnabled = false
        }
        
        if checkForWinner() == "Player 1" {
            print("player 1 won!")
            disableButtons()
        } else if checkForWinner() == "Player 2" {
            print("player 2 won!")
            disableButtons()
            
        } else {
            print("the game is still going...")
        }
        
      numberOfTurns = numberOfTurns + 1
        if numberOfTurns == 9, numberOfTurns != 3, numberOfTurns == 3 {
             label.text = "No one won"
            disableButtons()
        }
    }
    
}

