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
    
    static func buttonState(_ buttonArray: [GameButton], _ state: Bool) {
        for button in buttonArray {
            button.isEnabled = state
        }
    }
}
