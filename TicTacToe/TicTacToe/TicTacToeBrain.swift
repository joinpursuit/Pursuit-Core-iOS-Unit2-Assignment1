//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation



struct TicTacToeBrain {
  let position: [GamePiece]
  let turn: GamePiece

    init(position: [GamePiece] = [.Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty], turn: GamePiece = .X) {
           self.position = position
           self.turn = turn
           
       }
    

}
