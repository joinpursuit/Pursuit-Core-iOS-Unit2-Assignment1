//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var buttonText: UIButton!
  
  
  
  
  
  @IBOutlet weak var message: UILabel!
  @IBOutlet weak var playerOneScore: UILabel!
  @IBOutlet weak var playerTwoScore: UILabel!
  
  var xo: Int = 0
//  var playing: Bool = true
  var winningSets: [Set <Int>] = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  
  @IBAction func button(_ sender: UIButton) {
        if xo % 2 == 0 && sender.isEnabled == true {
          xo += 1
          sender.isEnabled = false
          sender.setTitle("O", for: [])
          playerOne.moves.insert(sender.tag)
          checkWin()
        } else {
        if xo % 2 != 0 && sender.isEnabled == true {
          xo += 1
          sender.isEnabled = false
          sender.setTitle("X", for: [])
          playerTwo.moves.insert(sender.tag)
          checkWin()
        } else {
          print("choose a different")
      }
    }
  }
  
  
  
  func checkWin() {
    for set in winningSets {
      if set.isSubset(of: playerOne.moves) {
        playerOne.winCount += 1
        self.message.text = "player one wins"
        self.playerOneScore.text = "score: \(playerOne.winCount)"
        playerOne.moves = [0]
        playerTwo.moves = [0]
      }else {
      if set.isSubset(of: playerTwo.moves) {
        playerTwo.winCount += 1
        self.message.text = "player two wins"
        self.playerTwoScore.text = "score: \(playerTwo.winCount)"
          playerOne.moves = [0]
          playerTwo.moves = [0]
       }
    }
  }
}
  
  @IBAction func reset(_ sender: UIButton) {
    gameReset()
  }
  
  func gameReset() {
    for x in 1...9 {
      var resestButton = self.view.viewWithTag(x) as! UIButton;
      resestButton.isEnabled = true
      resestButton.setTitle("", for: [])
    }
    playerOne.moves = [0]
    playerTwo.moves = [0]
    self.message.text = "Time To Tic Tac Toe"
    xo = 0
  }
  
  
  struct Player {
    var name: String
    var moves: Set <Int>
    var winCount: Int
  }
  
  var playerOne = Player(name: "Player 1", moves: [0], winCount: 0)
  var playerTwo = Player(name: "Player 2", moves: [0], winCount: 0)
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
}




//after move, check for win or draw
//if win add win to Player winCount then ask to play again
//if draw ask to play again
//if no win or draw keep playing
// if play again, reset all tiles
