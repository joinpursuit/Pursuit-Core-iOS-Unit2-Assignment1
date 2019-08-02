//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Michelle Cueva on 8/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let playO = UIImage(named: "playO")
    let playX = UIImage(named: "playX")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class TicTacButton: UIButton {
    @IBInspectable var row: Int
    @IBInspectable var col: Int
}

