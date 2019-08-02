//
//  ViewController.swift
//  TicTacToeProject
//
//  Created by Kevin Natera on 7/31/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = Player.p1
    var currentLetter = ""
    var p1Score = 0
    var p2Score = 0
    var switchScore = 0
    
    //20+ drags let's get it!
    @IBOutlet weak var topLeftOutlet: UIButton!
    
    @IBOutlet weak var topMiddleOutlet: UIButton!
    
    @IBOutlet weak var topRightOutlet: UIButton!
    
    @IBOutlet weak var centerLeftOutlet: UIButton!
    
    @IBOutlet weak var centerMiddleOutlet: UIButton!
    
    @IBOutlet weak var centerRightOutlet: UIButton!
    
    @IBOutlet weak var bottomLeftOutlet: UIButton!
    
    @IBOutlet weak var bottomMiddleOutlet: UIButton!
    
    @IBOutlet weak var bottomRightOutlet: UIButton!
    
    @IBOutlet weak var p1ScoreOutlet: UILabel!
    
    @IBOutlet weak var p2ScoreOutlet: UILabel!
    
    @IBOutlet weak var messageOutlet: UILabel!
    
    
    
    @IBAction func newGameButton(_ sender: UIButton) {
        switch currentPlayer {
        case .p1:
            enableAllButtons()
        case .p2:
            currentPlayer.changeTurn()
            enableAllButtons()
        }
        
        messageOutlet.text = "It's Player One's turn!"
        
        
        topLeftOutlet.setTitle("", for: .normal)
        topMiddleOutlet.setTitle("", for: .normal)
        topRightOutlet.setTitle("", for: .normal)
        centerLeftOutlet.setTitle("", for: .normal)
        centerMiddleOutlet.setTitle("", for: .normal)
        centerRightOutlet.setTitle("", for: .normal)
        bottomLeftOutlet.setTitle("", for: .normal)
        bottomMiddleOutlet.setTitle("", for: .normal)
        bottomRightOutlet.setTitle("", for: .normal)
        
       resetTags()
    }
    
    
    @IBAction func resetScore(_ sender: UIButton) {
        p1Score = 0
        p2Score = 0
        p1ScoreOutlet.text = "\(p1Score)"
        p2ScoreOutlet.text = "\(p2Score)"
    }
    
    
    @IBAction func switchScore(_ sender: UIButton) {
        switchScore = p1Score
        p1ScoreOutlet.text = "\(p2Score)"
        p1Score = p2Score
        p2ScoreOutlet.text = "\(switchScore)"
        p2Score = switchScore
        switchScore = 0
    }
    
    
    @IBAction func topLeftButton(_ sender: UIButton) {
        changeLetter()
        topLeftOutlet.setTitle(currentLetter, for: .normal)
        topLeftOutlet.isEnabled = false
        tagSpace(UIButtonOutlet: topLeftOutlet)
        checkWin()
        currentPlayer.changeTurn()
        displayWhosTurn()
        
    }
    
    
    
    @IBAction func topMiddleButton(_ sender: UIButton) {
        changeLetter()
        topMiddleOutlet.setTitle(currentLetter, for: .normal)
        topMiddleOutlet.isEnabled = false
        tagSpace(UIButtonOutlet: topMiddleOutlet)
        checkWin()
        currentPlayer.changeTurn()
        displayWhosTurn()
        
    }
    
    
    
    @IBAction func topRightButton(_ sender: UIButton) {
        changeLetter()
        topRightOutlet.setTitle(currentLetter, for: .normal)
        topRightOutlet.isEnabled = false
        tagSpace(UIButtonOutlet: topRightOutlet)
        checkWin()
        currentPlayer.changeTurn()
        displayWhosTurn()
        
    }
    
    
    
    
    @IBAction func centerLeftButton(_ sender: UIButton) {
        changeLetter()
        centerLeftOutlet.setTitle(currentLetter, for: .normal)
        centerLeftOutlet.isEnabled = false
        tagSpace(UIButtonOutlet: centerLeftOutlet)
        checkWin()
        currentPlayer.changeTurn()
        displayWhosTurn()
        
    }
    
    
    
    @IBAction func centerMiddleButton(_ sender: UIButton) {
        changeLetter()
        centerMiddleOutlet.setTitle(currentLetter, for: .normal)
        centerMiddleOutlet.isEnabled = false
        tagSpace(UIButtonOutlet: centerMiddleOutlet)
        checkWin()
        currentPlayer.changeTurn()
        displayWhosTurn()
    }
    
    
    
    @IBAction func centerRightButton(_ sender: UIButton) {
        changeLetter()
        centerRightOutlet.setTitle(currentLetter, for: .normal)
        centerRightOutlet.isEnabled = false
        tagSpace(UIButtonOutlet: centerRightOutlet)
        checkWin()
        currentPlayer.changeTurn()
        displayWhosTurn()
        
    }
    
    
    @IBAction func bottomLeftButton(_ sender: UIButton) {
        changeLetter()
        bottomLeftOutlet.setTitle(currentLetter, for: .normal)
        bottomLeftOutlet.isEnabled = false
        tagSpace(UIButtonOutlet: bottomLeftOutlet)
        checkWin()
        currentPlayer.changeTurn()
        displayWhosTurn()
    }
    
    
    @IBAction func bottomMiddleButton(_ sender: UIButton) {
        changeLetter()
        bottomMiddleOutlet.setTitle(currentLetter, for: .normal)
        bottomMiddleOutlet.isEnabled = false
        tagSpace(UIButtonOutlet: bottomMiddleOutlet)
        checkWin()
        currentPlayer.changeTurn()
        displayWhosTurn()
        
    }
    
    
    @IBAction func bottomRightButton(_ sender: UIButton) {
        changeLetter()
        bottomRightOutlet.setTitle(currentLetter, for: .normal)
        bottomRightOutlet.isEnabled = false
        tagSpace(UIButtonOutlet: bottomRightOutlet)
        checkWin()
        currentPlayer.changeTurn()
        displayWhosTurn()
    }
    
    
    
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
    
    func changeLetter() {
        switch currentPlayer {
        case .p1:
            currentLetter = "X"
        case .p2:
            currentLetter = "O"
        }
    }
    
    
    func disableAllButtons() {
        topLeftOutlet.isEnabled = false
        topMiddleOutlet.isEnabled = false
        topRightOutlet.isEnabled = false
        centerLeftOutlet.isEnabled = false
        centerMiddleOutlet.isEnabled = false
        centerRightOutlet.isEnabled = false
        bottomLeftOutlet.isEnabled = false
        bottomMiddleOutlet.isEnabled = false
        bottomRightOutlet.isEnabled = false
    }
    
    func enableAllButtons() {
        topLeftOutlet.isEnabled = true
        topMiddleOutlet.isEnabled = true
        topRightOutlet.isEnabled = true
        centerLeftOutlet.isEnabled = true
        centerMiddleOutlet.isEnabled = true
        centerRightOutlet.isEnabled = true
        bottomLeftOutlet.isEnabled = true
        bottomMiddleOutlet.isEnabled = true
        bottomRightOutlet.isEnabled = true
    }
    
    func tagSpace(UIButtonOutlet: UIButton) {
        switch currentPlayer {
        case .p1:
            UIButtonOutlet.tag = 1
        case .p2:
            UIButtonOutlet.tag = 2
        }
    }
    
    func resetTags() {
        topLeftOutlet.tag = 0
        topMiddleOutlet.tag = 0
        topRightOutlet.tag = 0
        centerLeftOutlet.tag = 0
        centerMiddleOutlet.tag = 0
        centerRightOutlet.tag = 0
        bottomLeftOutlet.tag = 0
        bottomMiddleOutlet.tag = 0
        bottomRightOutlet.tag = 0
    }
    
    /*I know that this is a ridiculous if statement and that I should've put the buttons into an outlet collection and iterated through that to find the winning combinations just like the matrix example from a few weeks ago, but I got it working this way and I'm tireddd 😂*/
    
    func checkWin() {
        if /* row1 */ (topLeftOutlet.tag == topMiddleOutlet.tag && topLeftOutlet.tag == topRightOutlet.tag && topLeftOutlet.tag != 0)  || /* row2 */ (centerLeftOutlet.tag == centerMiddleOutlet.tag && centerLeftOutlet.tag == centerRightOutlet.tag && centerLeftOutlet.tag != 0)  || /* row3 */ (bottomLeftOutlet.tag == bottomMiddleOutlet.tag && bottomLeftOutlet.tag == bottomRightOutlet.tag && bottomLeftOutlet.tag != 0)  || /* col1 */ (topLeftOutlet.tag == centerLeftOutlet.tag && topLeftOutlet.tag == bottomLeftOutlet.tag && topLeftOutlet.tag != 0)  ||  /* col2 */(topMiddleOutlet.tag == centerMiddleOutlet.tag && topMiddleOutlet.tag == bottomMiddleOutlet.tag && topMiddleOutlet.tag != 0)  || /* col3 */ (topRightOutlet.tag == centerRightOutlet.tag && topRightOutlet.tag == bottomRightOutlet.tag && topRightOutlet.tag != 0)  || /*right diag */ (topLeftOutlet.tag == centerMiddleOutlet.tag && topLeftOutlet.tag == bottomRightOutlet.tag && topLeftOutlet.tag != 0) || /*left diag */ (topRightOutlet.tag == centerMiddleOutlet.tag && topRightOutlet.tag == bottomLeftOutlet.tag && topRightOutlet.tag != 0)  {
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
        //this is pretty ridiculous too lol
        if (topLeftOutlet.isEnabled == false && topMiddleOutlet.isEnabled == false && topRightOutlet.isEnabled == false && centerLeftOutlet.isEnabled == false && centerMiddleOutlet.isEnabled == false && centerRightOutlet.isEnabled == false && bottomLeftOutlet.isEnabled == false && bottomMiddleOutlet.isEnabled == false && bottomRightOutlet.isEnabled == false) && topLeftOutlet.tag != 0 {
            messageOutlet.text = "Draw!!!"
            disableAllButtons()
        }

    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disableAllButtons()
    }



    
}


