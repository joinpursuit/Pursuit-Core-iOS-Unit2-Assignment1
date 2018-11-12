//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {

    
    static func assignXO(player: Bool, _ sender: GameButton, text: UILabel) {
        if player {
            
            sender.setImage(UIImage(named: "XTic"), for: .normal)
            text.text = "Player two's turn!"
            

            //append col, append row if three of the same number then win or a 0,1,2 in col and row(check for this first)
            
            
        } else {
            sender.setImage(UIImage(named: "OTac"), for: .normal)
            text.text = "Player one's turn!"
        }
        sender.isEnabled = false
    }

    static func checkWinnerVertHor(player: Bool,_ sender: GameButton, countColX: [Int], countRowX: [Int], countColO: [Int], countRowO: [Int])-> Bool {
        if player {
            print("counter col X is \(countColX)")
            print("counter Row X is \(countRowX)")
            for numbers in 0...2 {
                if countColX.filter({$0 == numbers}).count == 3 {
                    print("X col win")
                    return true
                    
                }
                if countRowX.filter({$0 == numbers}).count == 3 {
                    print("X row win")
                    return true
                }
            }
        } else {
            print("counter col O is \(countColX)")
            print("counter Row O is \(countRowX)")
            for numbers in 0...2 {
                if countColO.filter({$0 == numbers}).count == 3 {
                    print("O col win")
                    return true
                    
                }
                if countRowO.filter({$0 == numbers}).count == 3 {
                    print("O row win")
                    return true
                }
            }
        }
        return false
    }
    
    static func checkWinnerDiag() {
        //must use if sender image for 3 buttons are x then win
    }
}
