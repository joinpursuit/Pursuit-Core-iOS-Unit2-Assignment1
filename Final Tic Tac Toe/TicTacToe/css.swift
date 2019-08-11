//
//  css.swift
//  TicTacToe
//
//  Created by Jack Wong on 8/8/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation
import UIKit

func btnCSS(_ buttons: [UIButton]){
    for button in buttons{
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.numberOfLines = 0  
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 4.0
    }
}

func newGameBtnCSS(_ button: UIButton){
    button.setTitle("New Game", for: .normal)
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 2.0
    button.layer.cornerRadius = 16
}
