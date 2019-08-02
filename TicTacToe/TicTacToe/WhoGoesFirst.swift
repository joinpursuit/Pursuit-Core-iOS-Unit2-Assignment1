//
//  WhoGoesFirst.swift
//  TicTacToe
//
//  Created by Radharani Ribas-Valongo on 8/2/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
import UIKit

struct WhoGoesFirst {
    var playerTurn: String
    
    init(){
        playerTurn = "x"
    }
    
    
    mutating func player1go(symbol: String) -> Bool {
        playerTurn = symbol
        return playerTurn == symbol
    }
    
}

