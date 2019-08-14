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



var currentPlayer = Player.p1
var currentLetter = ""
var p1Score = 0
var p2Score = 0
var switchedScore = 0


func changeLetter() {
    switch currentPlayer {
    case .p1:
        currentLetter = "X"
    case .p2:
        currentLetter = "O"
    }
}

func resetPlayerScores() {
    p1Score = 0
    p2Score = 0
}
