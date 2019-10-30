//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController {
    var xOrO = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonPressXorO(_ sender: GameButton) {
        
        if #available(iOS 13.0, *) {
            if xOrO {
            sender.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
            } else {
            sender.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            }
        } else {
            // Fallback on earlier versions
        }
        
        xOrO.toggle()
        // Fallback on earlier versions
    }
    
}

