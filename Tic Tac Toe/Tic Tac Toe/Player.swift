//
//  File.swift
//  Tic Tac Toe
//
//  Created by Michelle Cueva on 8/3/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation
import UIKit

enum Player: Int {
    
    case player1 = 1
    
    case player2 = 2
    
    mutating func switchPlayer() {
        switch self {
        case .player1:
            self = .player2
        case .player2:
            self = .player1
        }
    }
}


