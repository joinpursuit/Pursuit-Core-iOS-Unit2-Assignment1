//
//  GameButton.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GameButton: UIButton {
  @IBInspectable var row: Int = 0
  @IBInspectable var col: Int = 0
    
    // MARK: Mutators of GameButton
    func setRowAndCol(row: Int, col: Int){
        self.row = row
        self.col = col
    }
    
    func setRow(row: Int){
        self.row = row
    }
    
    func setCol(col: Int){
        self.col = col
    }
}
