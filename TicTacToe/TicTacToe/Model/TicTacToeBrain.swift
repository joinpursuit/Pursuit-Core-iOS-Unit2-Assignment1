//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
  // This is where you will model logic!!
    
    enum xo : String, CaseIterable {
        case x
        case o
        
        func image() -> UIImage {
            var boxImage: UIImage!
            switch self {
            case .x:
                boxImage = UIImage(named: "X")
            case .o:
                boxImage = UIImage(named: "O")
            }
            return boxImage
        }
        
    }
    
    
}

