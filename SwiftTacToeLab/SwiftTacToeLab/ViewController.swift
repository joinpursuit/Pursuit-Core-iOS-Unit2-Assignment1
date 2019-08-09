//
//  ViewController.swift
//  SwiftTacToeLab
//
//  Created by Malcolm S. Turnquest on 8/8/19.
//  Copyright © 2019 Malcolm S. Turnquest. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

  
    @IBOutlet var TicTac1: UIImageView! = nil
    @IBOutlet var TicTac2: UIImageView! = nil
    @IBOutlet var TicTac3: UIImageView! = nil
    @IBOutlet var TicTac4: UIImageView! = nil
    @IBOutlet var TicTac5: UIImageView! = nil
    @IBOutlet var TicTac6: UIImageView! = nil
    @IBOutlet var TicTac7: UIImageView! = nil
    @IBOutlet var TicTac8: UIImageView! = nil
    @IBOutlet var TicTac9: UIImageView! = nil
    
    @IBOutlet var TIcTacButton1: UIButton! = nil
    @IBOutlet var TIcTacButton2: UIButton! = nil
    @IBOutlet var TIcTacButton3: UIButton! = nil
    @IBOutlet var TIcTacButton4: UIButton! = nil
    @IBOutlet var TIcTacButton5: UIButton! = nil
    @IBOutlet var TIcTacButton6: UIButton! = nil
    @IBOutlet var TIcTacButton7: UIButton! = nil
    @IBOutlet var TIcTacButton8: UIButton! = nil
    @IBOutlet var TIcTacButton9: UIButton! = nil

    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var userMessage: UILabel!
    
    var plays: [Int: Int] = [:]
    
    var done = false
    
    var aiDeciding = false
    
    @IBAction func uiBottonClicked(sender: UIButton){
        
        userMessage.isHidden = true
        
        if !(plays[sender.tag] != nil) && !aiDeciding && !done {
            setImageForBox(box: sender.tag, player: 1)
            
        }
        
        checkForWin()
        
        aiTurn()
    }
    
    @IBAction func resetButtonClicked(sender: UIButton) {
        done = false
        resetButton.isHidden = true
        userMessage.isHidden = true
        reset()
    }
    
    func reset() {
        plays = [:]
        TicTac1.image = nil
        TicTac2.image = nil
        TicTac3.image = nil
        TicTac4.image = nil
        TicTac5.image = nil
        TicTac6.image = nil
        TicTac7.image = nil
        TicTac8.image = nil
        TicTac9.image = nil
    }
    
    func setImageForBox(box:Int, player:Int) {
        let playerMark = player == 1 ? "x" : "o"
        plays[box] = player
        
        switch box {
        case 1:
            TicTac1.image = UIImage(named: playerMark)
        case 2:
            TicTac2.image = UIImage(named: playerMark)
        case 3:
            TicTac3.image = UIImage(named: playerMark)
        case 4:
            TicTac4.image = UIImage(named: playerMark)
        case 5:
            TicTac5.image = UIImage(named: playerMark)
        case 6:
            TicTac6.image = UIImage(named: playerMark)
        case 7:
            TicTac7.image = UIImage(named: playerMark)
        case 8:
            TicTac8.image = UIImage(named: playerMark)
        case 9:
            TicTac9.image = UIImage(named: playerMark)
        default:
            TicTac5.image = UIImage(named: playerMark)
        }
        
    }
    
    func checkForWin() {
        
        var whoWon = ["I":0, "You":1]
        
        for(key,value) in whoWon {
            if (plays[7] == value && plays[8] == value && plays[9] == value) || //across the bottom
            (plays[4] == value && plays[5] == value && plays[6] == value) || //across the center
            (plays[1] == value && plays[2] == value && plays[3] == value) || //across the top
            (plays[1] == value && plays[4] == value && plays[7] == value) || //down the left
            (plays[2] == value && plays[5] == value && plays[8] == value) || //down the middle
            (plays[3] == value && plays[6] == value && plays[9] == value) || //down the right
            (plays[1] == value && plays[5] == value && plays[9] == value) || //left to right
                (plays[3] == value && plays[5] == value && plays[7] == value) { //right to left
                
                userMessage.isHidden = false
                userMessage.text = "Looks Like \(key) Won!"
                resetButton.isHidden = false
                done = true
                
            }
            
        }
        
    }
    
    func checkTop(player: Int) -> (location: String, pattern: String) {
        return ("top", checkFor(value, inList: [1,2,3]))
    }
    
    func checkCenter(player: Int) -> (location: String, pattern: String) {
        return ("center", checkFor(value, inList: [4,5,6]))
    }
    
    func checkBottom(player: Int) -> (location: String, pattern: String) {
        return ("bottom", checkFor(value, inList: [7,8,9]))
    }
    
    func checkLeft(player: Int) -> (location: String, pattern: String) {
        return ("left", checkFor(value, inList: [1,4,7]))
    }
    
    func checkMiddle(player: Int) -> (location: String, pattern: String) {
        return ("middle", checkFor(value, inList: [2,5,8]))
    }
    
    func checkRight(player: Int) -> (location: String, pattern: String) {
        return ("right", checkFor(value, inList: [3,6,9]))
    }
    
    func checkLeftRight(player: Int) -> (location: String, pattern: String) {
        return ("left-right", checkFor(value, inList: [1,5,9]))
    }
    
    func checkRightLeft(player: Int) -> (location: String, pattern: String) {
        return ("right-left", checkFor(value, inList: [3,5,7]))
    }
    
    func checkFor(player: Int, inList: [Int]) -> String {
        var conclusion = ""
        for cell in inList {
            
            if plays[cell] == player {
                conclusion += "1"
            } else {
                conclusion += "0"
            }
            
        }
        
        return conclusion
        
    }
    
    func rowCheck(player: Int) -> (location: String, pattern: String)? {
        var acceptableFinds = ["011", "110", "101"]
        var findFuncs = [checkTop, checkBottom, checkCenter, checkLeft, checkRight, checkMiddle, checkLeftRight, checkRightLeft]
        for algorithm in findFuncs {
            var algorithmResults = algorithm(value: player)
            if find(acceptableFinds, algorithmResults) -> (pattern: String) {
                return(algorithmResults)
            }
        }
        
    }
    
    func isOccupied(box: Int) -> Bool {
        
        return Bool(plays[box])
    }
    
    func aiTurn() {
        
        if done {
            return
        }
        
        aiDeciding = true
        
        //we (the computer) have two in a row
        if let result = rowCheck(player:0) {
            var whereToPlayResult = whereToPlay(result.location, pattern: result.pattern)
            if !isOccupied(whereToPlayResult){
            
            setImageForBox(whereToPlayResult, player: 0)
            aiDeciding = false
            checkForWin()
            return
        }
            //you (the player) have two in a row
            if let result = rowCheck(player:1) {
                var whereToPlayResult = whereToPlay(result.location, pattern: result.pattern)
                if !isOccupied(whereToPlayResult){
                
                setImageForBox(whereToPlayResult, player: 0)
                aiDeciding = false
                checkForWin()
                return
            }
                
        }
            
            // is the center available?
            if isOccupied[5]{
                setImageForBox(5, player: 0)
                aiDeciding = false
                checkForWin()
                return
            }
            
            // is a corner available?
            
            
            //is a side available?
            
            
        aiDeciding = false
        
        
        
    }
    
    func whereToPlay(location: String, pattern: String) -> Int {
        
        var leftPattern = "011"
        var rightPattern = "110"
        var middlePattern = "101"
        
        switch location {
        case "top":
            if pattern == leftPattern {
                return 1
            } else if pattern == rightPattern {
                return 3
            } else {
                return 2
            }
        case "center":
            if pattern == leftPattern {
                return 4
        } else if pattern == rightPattern {
            return 6
        } else {
            return 5
        }
            case "bottom":
            if pattern == leftPattern {
                return 7
            } else if pattern == rightPattern {
                return 9
            } else {
                return 8
            }
            case "top":
            if pattern == leftPattern {
                return 1
            } else if pattern == rightPattern {
                return 3
            } else {
                return 2
            }
            case "top":
            if pattern == leftPattern {
                return 1
            } else if pattern == rightPattern {
                return 3
            } else {
                return 2
            }
            case "top":
            if pattern == leftPattern {
                return 1
            } else if pattern == rightPattern {
                return 3
            } else {
                return 2
            }
            case "top":
            if pattern == leftPattern {
                return 1
            } else if pattern == rightPattern {
                return 3
            } else {
                return 2
            }
            case "top":
            if pattern == leftPattern {
                return 1
            } else if pattern == rightPattern {
                return 3
            } else {
                return 2
            }
        default:
            return 4
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

