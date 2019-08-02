//
//  Model.swift
//  TicTacToeProject
//
//  Created by Kevin Natera on 8/1/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit


enum Player {
    case p1
    case p2

    mutating func changeTurn() {
        switch self {
        case .p1:
            self = Player.p2

        case .p2:
            self = Player.p1
        }
    }
}
