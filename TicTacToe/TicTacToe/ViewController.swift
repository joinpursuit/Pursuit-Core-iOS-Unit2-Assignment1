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

    
    @IBOutlet weak var firstButton: GameButton!
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
//    firstButton.row == 0,0{
//        
//    }
    
    print("we are making tic tac toe!")
    
  }


}

