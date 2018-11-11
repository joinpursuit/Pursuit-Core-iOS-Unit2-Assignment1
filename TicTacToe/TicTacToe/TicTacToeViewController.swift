//
//  TicTacToeViewController.swift
//  TicTacToe
//
//  Created by Biron Su on 11/9/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    var gameOver = false
    var ticTacToe = TicTacToeBrain()
    @IBOutlet weak var firstButton: GameButton!
    @IBOutlet weak var secondButton: GameButton!
    @IBOutlet weak var thirdButton: GameButton!
    @IBOutlet weak var fourthButton: GameButton!
    @IBOutlet weak var fifthButton: GameButton!
    @IBOutlet weak var sixthButton: GameButton!
    @IBOutlet weak var seventhButton: GameButton!
    @IBOutlet weak var eighthButton: GameButton!
    @IBOutlet weak var ninthButton: GameButton!
    
    @IBOutlet weak var gameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let array = [firstButton, secondButton, thirdButton, fourthButton, fifthButton, sixthButton, seventhButton, eighthButton, ninthButton]
        array.forEach{$0?.setImage(UIImage(named: "smile"), for: .normal)}
    }
    @IBAction func buttonPressed (_ sender: GameButton!) {
        let array = [firstButton, secondButton, thirdButton, fourthButton, fifthButton, sixthButton, seventhButton, eighthButton, ninthButton]
        ticTacToe.thinking(a: sender.row, b: sender.col)
        gameLabel.text = ticTacToe.gameString
        sender.setImage(UIImage.init(named: ticTacToe.imageChange), for: .normal)
        sender.isEnabled = false
        gameOver = ticTacToe.gameOver
        if gameOver == true {
            array.forEach{$0?.isEnabled = false}
        }
    }
    @IBAction func resetToOriginalState(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
}
}
