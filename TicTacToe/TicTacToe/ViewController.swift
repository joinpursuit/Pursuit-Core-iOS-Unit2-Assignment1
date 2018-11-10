//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

//THIS HANGDLES IF BUTTONS ARE ACTIVE OR INACTIVE


//BUTTON ISHIDDEN(NOT THIS CASE)...  ISENABLED - IS ON BOARD BUT NOT ACTIVE

//TRANSPARENT BUTTON IS THE KEY

class ViewController: UIViewController {
    //outlets:

    @IBOutlet weak var cuadriculaImage: UIImageView!
    
    
    @IBOutlet weak var player1Turn: UILabel!
    @IBOutlet weak var player2Turn: UILabel!
    

    @IBOutlet var arrayOfButtons: [GameButton]!
    @IBOutlet weak var titleLabel: UILabel!
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    //setUp function with everything that goes inside
        //-is enable = true
        //-cuadricula
    
//    firstButton.row == 0,0{
//    }
  }

    //actions:

    @IBAction func letsPlay(_ sender: GameButton){
        
        }
}

