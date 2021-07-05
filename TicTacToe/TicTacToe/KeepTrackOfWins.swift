//
//  KeepTrackOfWins.swift
//  TicTacToe
//
//  Created by Elizabeth Peraza  on 11/17/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class KeepScore: TicTacToeBrain{
    var ticTacToe = TicTacToeBrain()
    
    var scorePlayerOne: Int = 0
    var scorePlayerTwo: Int = 0
    
    func updateCounter(playerOneWins: Bool){
        if playerOneWins{
            scorePlayerOne += 1
            print(scorePlayerOne)
        }else if playerOneWins == false{
            scorePlayerTwo += 1
            print(scorePlayerTwo)
        }
    }
}
