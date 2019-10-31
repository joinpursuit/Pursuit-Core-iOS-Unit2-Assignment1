//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    static var xTurn: Bool = true
    static func xOrO (_ button: GameButton) {
        if #available(iOS 13.0, *) {
            if xTurn {
                button.setBackgroundImage(UIImage(systemName: "xmark"), for: .disabled)
            } else {
                button.setBackgroundImage(UIImage(systemName: "circle"), for: .disabled)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

