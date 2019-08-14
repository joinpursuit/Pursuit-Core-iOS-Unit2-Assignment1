//
//  ViewController.swift
//  TicTacToeProject
//
//  Created by Kevin Natera on 7/31/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var topLeftOutlet: UIButton!
    
    @IBOutlet weak var topMiddleOutlet: UIButton!
    
    @IBOutlet weak var topRightOutlet: UIButton!
    
    @IBOutlet weak var centerLeftOutlet: UIButton!
    
    @IBOutlet weak var centerMiddleOutlet: UIButton!
    
    @IBOutlet weak var centerRightOutlet: UIButton!
    
    @IBOutlet weak var bottomLeftOutlet: UIButton!
    
    @IBOutlet weak var bottomMiddleOutlet: UIButton!
    
    @IBOutlet weak var bottomRightOutlet: UIButton!
    
    @IBOutlet var allButtons: [UIButton]!
    
    @IBOutlet weak var p1ScoreOutlet: UILabel!
    
    @IBOutlet weak var p2ScoreOutlet: UILabel!
    
    @IBOutlet weak var messageOutlet: UILabel!
    
    //MARK: - Actions
    @IBAction func newGameButton(_ sender: UIButton) {
        switch currentPlayer {
        case .p1:
            enableAllButtons()
        case .p2:
            currentPlayer.changeTurn()
            enableAllButtons()
        }
        
        messageOutlet.text = "It's Player One's turn!"
        
        for i in allButtons {
            i.setTitle("", for: .normal)
        }
       resetTags()
    }
    
    
    @IBAction func resetScore(_ sender: UIButton) {
        resetPlayerScores()
        p1ScoreOutlet.text = "\(p1Score)"
        p2ScoreOutlet.text = "\(p2Score)"
    }
    
    
    @IBAction func switchScore(_ sender: UIButton) {
        switchedScore = p1Score
        p1ScoreOutlet.text = "\(p2Score)"
        p1Score = p2Score
        p2ScoreOutlet.text = "\(switchedScore)"
        p2Score = switchedScore
        switchedScore = 0
    }
    
    
    @IBAction func topLeftButton(_ sender: UIButton) {
        tagSpace(topLeftOutlet)
        checkWin()
    }
    
    @IBAction func topMiddleButton(_ sender: UIButton) {
        tagSpace(topMiddleOutlet)
        checkWin()
    }
    
    @IBAction func topRightButton(_ sender: UIButton) {
        tagSpace(topRightOutlet)
        checkWin()
    }
    
    @IBAction func centerLeftButton(_ sender: UIButton) {
        tagSpace(centerLeftOutlet)
        checkWin()
    }
    
    @IBAction func centerMiddleButton(_ sender: UIButton) {
        tagSpace(centerMiddleOutlet)
        checkWin()
    }
    
    @IBAction func centerRightButton(_ sender: UIButton) {
        tagSpace(centerRightOutlet)
        checkWin()
    }
    
    @IBAction func bottomLeftButton(_ sender: UIButton) {
        tagSpace(bottomLeftOutlet)
        checkWin()
    }
    
    
    @IBAction func bottomMiddleButton(_ sender: UIButton) {
        tagSpace(bottomMiddleOutlet)
        checkWin()
    }
    
    @IBAction func bottomRightButton(_ sender: UIButton) {
        tagSpace(bottomRightOutlet)
        checkWin()
    }
    
    //MARK: - Methods
    func displayWhosTurn() {
        if messageOutlet.text != "Player One wins!!!" && messageOutlet.text != "Player Two wins!!!" && messageOutlet.text != "Draw!!!" {
        switch currentPlayer {
        case .p1:
            messageOutlet.text = "It's Player One's turn!"
        case .p2:
            messageOutlet.text = "It's Player Two's turn!"
        }
    }
    }
   
    func disableAllButtons() {
        for i in allButtons {
            i.isEnabled = false
        }
    }
    
    func enableAllButtons() {
        for i in allButtons {
            i.isEnabled = true
        }
    }
    
    func tagSpace(_ UIButtonOutlet: UIButton) {
        changeLetter()
        
        switch currentPlayer {
        case .p1:
            UIButtonOutlet.tag = 1
        case .p2:
            UIButtonOutlet.tag = 2
        }
        
        UIButtonOutlet.setTitle(currentLetter, for: .normal)
        UIButtonOutlet.isEnabled = false
    }
    
    func resetTags() {
        for i in allButtons {
            i.tag = 0
        }
    }
    
    
    func checkWin() {
        if /* row1 */ (topLeftOutlet.tag == topMiddleOutlet.tag && topLeftOutlet.tag == topRightOutlet.tag && topLeftOutlet.tag != 0)  || /* row2 */ (centerLeftOutlet.tag == centerMiddleOutlet.tag && centerLeftOutlet.tag == centerRightOutlet.tag && centerLeftOutlet.tag != 0)  || /* row3 */ (bottomLeftOutlet.tag == bottomMiddleOutlet.tag && bottomLeftOutlet.tag == bottomRightOutlet.tag && bottomLeftOutlet.tag != 0)  || /* col1 */ (topLeftOutlet.tag == centerLeftOutlet.tag && topLeftOutlet.tag == bottomLeftOutlet.tag && topLeftOutlet.tag != 0)  ||  /* col2 */(topMiddleOutlet.tag == centerMiddleOutlet.tag && topMiddleOutlet.tag == bottomMiddleOutlet.tag && topMiddleOutlet.tag != 0)  || /* col3 */ (topRightOutlet.tag == centerRightOutlet.tag && topRightOutlet.tag == bottomRightOutlet.tag && topRightOutlet.tag != 0)  || /*right diag */ (topLeftOutlet.tag == centerMiddleOutlet.tag && topLeftOutlet.tag == bottomRightOutlet.tag && topLeftOutlet.tag != 0) || /*left diag */ (topRightOutlet.tag == centerMiddleOutlet.tag && topRightOutlet.tag == bottomLeftOutlet.tag && topRightOutlet.tag != 0) {
            switch currentPlayer {
            case .p1:
                messageOutlet.text = "Player One wins!!!"
                p1Score += 1
                p1ScoreOutlet.text = "\(p1Score)"
                resetTags()
                disableAllButtons()
            case .p2:
                messageOutlet.text = "Player Two wins!!!"
                p2Score += 1
                p2ScoreOutlet.text = "\(p2Score)"
                resetTags()
                disableAllButtons()
            }
        }
        
        if (topLeftOutlet.isEnabled == false && topMiddleOutlet.isEnabled == false && topRightOutlet.isEnabled == false && centerLeftOutlet.isEnabled == false && centerMiddleOutlet.isEnabled == false && centerRightOutlet.isEnabled == false && bottomLeftOutlet.isEnabled == false && bottomMiddleOutlet.isEnabled == false && bottomRightOutlet.isEnabled == false) && topLeftOutlet.tag != 0 {
            messageOutlet.text = "Draw!!!"
            disableAllButtons()
        }
        
        currentPlayer.changeTurn()
        displayWhosTurn()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disableAllButtons()
        
    }

}


