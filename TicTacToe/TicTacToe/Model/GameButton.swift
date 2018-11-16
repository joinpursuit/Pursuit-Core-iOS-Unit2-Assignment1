//
//  GameButton.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GameButton: UIButton {
  //makes the special properties available in the story board
  @IBInspectable var row: Int = 0
  @IBInspectable var col: Int = 0
}
