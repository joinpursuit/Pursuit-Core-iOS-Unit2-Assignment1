//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet var gameButtons: [GameButton]!
    
    
    @IBOutlet weak var board: UIImageView!
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
  
  }
    
    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        print("row : \(gameButton.row) column : \(gameButton.col) was picked")
        
        //TODO: Ask why the error message popped up

            let board = UIImage.SymbolConfiguration(pointSize: 25, weight: .black, scale: .large)
            let xMark = UIImage(systemName: "xmark", withConfiguration: board)
            
            let oMark = UIImage(systemName: "circle", withConfiguration: board)

        
        
        
    }
    


}

