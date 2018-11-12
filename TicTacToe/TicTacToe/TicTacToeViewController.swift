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
    var picture = UIImage(named: "smile")

    @IBOutlet var collectionOfButtons: Array<GameButton>!
    @IBOutlet weak var gameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        collectionOfButtons.forEach{$0.setImage(picture, for: .normal)}
    }
    @IBAction func buttonPressed (_ sender: GameButton!) {
        ticTacToe.thinking(a: sender.row, b: sender.col)
        gameLabel.text = ticTacToe.gameString
        sender.setImage(UIImage.init(named: ticTacToe.imageChange), for: .normal)
        sender.isEnabled = false
        gameOver = ticTacToe.gameOver
        if gameOver == true {
            collectionOfButtons.forEach{$0.isEnabled = false}
        }
    }
    @IBAction func homeScreen(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
}
    @IBAction func resetGame(_ sender: UIButton) {
        ticTacToe.reset(a: true)
        collectionOfButtons.forEach{$0.setImage(picture, for: .normal)}
        collectionOfButtons.forEach{$0.isEnabled = true}
        gameLabel.text = "Game Reset! Player one's turn!"
        }
}
