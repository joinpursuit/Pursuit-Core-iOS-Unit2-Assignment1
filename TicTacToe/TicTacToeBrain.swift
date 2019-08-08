//
//  File.swift
//  TicTacToe
//
//  Created by EricM on 7/31/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import Foundation
import UIKit

class TicTacToeBrain: Equatable {
    static func == (lhs: TicTacToeBrain, rhs: TicTacToeBrain) -> Bool {
        return lhs.title == rhs.title
    }
    
    var btn: Int
    var title: String
    
    init(btn: Int, title: String) {
        self.btn = btn
        self.title = title
    }
    
    
}

var button1 = TicTacToeBrain(btn: 0, title: "")
var button2 = TicTacToeBrain(btn: 1, title: "")
var button3 = TicTacToeBrain(btn: 2, title: "")
var button4 = TicTacToeBrain(btn: 3, title: "")
var button5 = TicTacToeBrain(btn: 4, title: "")
var button6 = TicTacToeBrain(btn: 5, title: "")
var button7 = TicTacToeBrain(btn: 6, title: "")
var button8 = TicTacToeBrain(btn: 7, title: "")
var button9 = TicTacToeBrain(btn: 8, title: "")

var buttonList = [button1,button2,button3,button4,button5,button6,button7,button8,button9]

//func compare (a:TicTacToeBrain,a2: TicTacToeBrain, a3: TicTacToeBrain){
//    if a == a2 && a == a3 {
//        disable()
//    }
//}
//
//func allConditions(){
//    compare(a: button1, a2: button2, a3: button3)
//    compare(a: button4, a2: button5, a3: button6)
//    compare(a: button7, a2: button8, a3: button9)
//    compare(a: button1, a2: button4, a3: button6)
//    compare(a: button2, a2: button5, a3: button8)
//    compare(a: button3, a2: button6, a3: button9)
//    compare(a: button1, a2: button5, a3: button9)
//    compare(a: button3, a2: button5, a3: button7)
//}
