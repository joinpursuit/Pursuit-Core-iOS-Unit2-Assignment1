//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
//    private var topLeft = GameButton()
//    private var midLeft = GameButton()
//    private var bottomLeft = GameButton()
//    private var topMid = GameButton()
//    private var midMid = GameButton()
//    private var bottomMid = GameButton()
//    private var topRight = GameButton()
//    private var midRight = GameButton()
//    private var bottomRight = GameButton()
//
//    // MARK: Initializer of TicTacToeBrain Class
//    init(){
//        self.topLeft.setRowAndCol(row: 0, col: 0)
//        self.midLeft.setRowAndCol(row: 1, col: 0)
//        self.bottomLeft.setRowAndCol(row: 2, col: 0)
//        self.topMid.setRowAndCol(row: 0, col: 1)
//        self.midMid.setRowAndCol(row: 1, col: 1)
//        self.bottomMid.setRowAndCol(row: 2, col: 1)
//        self.topRight.setRowAndCol(row: 0, col: 2)
//        self.midRight.setRowAndCol(row: 1, col: 2)
//        self.bottomRight.setRowAndCol(row: 2, col: 2)
//    }
    
    //MARK: Methods of TicTacToeBrain
    func resetToNothing(_ arr: [GameButton]){
        for element in arr{
            element.setTitle("", for: .normal)
            element.isUserInteractionEnabled = true
        }
    }
    
    func exe(_ button: GameButton){
        button.setTitle("X", for: .normal)
        button.isUserInteractionEnabled = false
    }
    
    func oh(_ button: GameButton){
        button.setTitle("O", for: .normal)
        button.isUserInteractionEnabled = false
    }
}
