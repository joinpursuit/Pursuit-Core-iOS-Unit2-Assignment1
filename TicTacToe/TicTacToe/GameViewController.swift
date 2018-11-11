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
    
    
    @IBOutlet weak var tictactoex: UIButton!
    
   
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func PlayAgain(_ sender: UIButton) {
        updateGame()
    }
    
    func updateGame() {
        
        
    }
    
    let xImage = UIImage(named: "indexX")
    let oImage = UIImage(named: "indexO")
    
    var numberOfTurns = 0
    
    var playDict: [Int:Int] =
        [0:0, 1:0, 2:0,
         3:0, 4:0, 5:0,
         6:0, 7:0, 8:0]
    
    
    let winningTuples = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]
    
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
                break
            } else if result == -3 {
                winner = "Player 2"
                break
            } else {
                winner = "No winner yet"
            }
        }
        return winner
    }
    
    @IBAction func TicTacToeButton(_ sender: UIButton) {
        if numberOfTurns % 2 == 0 {
            sender.setImage(xImage, for: .normal)
            let dictKey = sender.tag
            playDict[dictKey] = 1
        } else {
            sender.setImage(oImage, for: .normal)
            let dictKey = sender.tag
            playDict[dictKey] = -1
        }
        numberOfTurns = numberOfTurns + 1
        
        if checkForWinner() == "Player 1" {
            print("player 1 won!")
        } else if checkForWinner() == "Player 2" {
            print("player 2 won!")
        } else {
            print("the game is still going...")
        }
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
