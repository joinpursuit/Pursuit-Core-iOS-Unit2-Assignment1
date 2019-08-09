//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kimball Yang on 8/8/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = TicTacToe()
    @IBOutlet weak var gridImage: UIImageView!
    
    var count = 1
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBAction func actionButton(_ sender: UIButton) {
       game.updateValues(sender: sender.tag)
        sender.isEnabled = false
        sender.setTitle(game.currentPlayer, for: .normal)
        if game.winCon() {
            theLabel.text = game.currentPlayer + " wins!"
        }
        
    }
    
    // condition
    
    
    @IBOutlet weak var theLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

