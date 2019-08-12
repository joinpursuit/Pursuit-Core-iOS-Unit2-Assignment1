//
//  startUpscreen.swift
//  TicTacToe
//
//  Created by Anthony Gonzalez on 8/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
import UIKit

class secondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBOutlet weak var textFieldOutlet2: UITextField!
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var player1XOSwitch: UISegmentedControl!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    var player1Shape = "O"
    var player2Shape = "X"
    var playerName = "Player 1"
    
    @IBOutlet weak var player2NameLabel: UILabel!
    var player2Name = "Player 2"
    
    @IBAction func goToSecondVC(_ sender: UIButton) {
        performSegue(withIdentifier: "toGame", sender: self)
    }
    
    @IBAction func player1XOPress(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            player1Shape = "O"
            player2Shape = "X"
            playerName = textFieldOutlet.text ?? "Player 1"
            if playerName.count == 0 {
                playerName = "Player 1"
            }
            playerNameLabel.text = "\(playerName) : [\(player1Shape)]"
            player2NameLabel.text = "\(player2Name) : [\(player2Shape)]"
            
        case 1:
            player1Shape = "X"
            player2Shape = "O"
            playerName = textFieldOutlet.text ?? "Player 1"
            if playerName.count == 0 {
                playerName = "Player 1"
            }
            playerNameLabel.text = "\(playerName) : [\(player1Shape)]"
            player2NameLabel.text = "\(player2Name) : [\(player2Shape)]"
        default: ()
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0 && (string == " ") { //User cannot enter empty space at the start.
            return false
        }
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 9 //Limits user input to 9 characters.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 0:
            if let textFieldName = textFieldOutlet.text{
                if textFieldName.count != 0 {
                    playerName = textFieldName.capitalized
                    playerNameLabel.text = "\(playerName) : [\(player1Shape)]"
                } else {return false}
            }
            textFieldOutlet.resignFirstResponder()
    
        case 1:
            if let textFieldName2 = textFieldOutlet2.text {
                if textFieldName2.count != 0 {
                    player2Name = textFieldName2.capitalized
                    player2NameLabel.text = "\(player2Name) : [\(player2Shape)]"
                } else {return false}
            }
            textFieldOutlet2.resignFirstResponder()
           
        default: ()
        }
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        textFieldOutlet.delegate = self
        textFieldOutlet2.delegate = self
        startGameButton.layer.cornerRadius = startGameButton.frame.height / 2
        startGameButton.layer.borderColor = UIColor.white.cgColor
        startGameButton.layer.borderWidth = 2.0
        [playerNameLabel, player2NameLabel].forEach({ $0?.textAlignment = NSTextAlignment.center})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let destVC : ViewController = segue.destination as! ViewController
        destVC.player1.playerName = playerName
        destVC.player2.playerName = player2Name
        destVC.player1.playerShape = player1Shape
        destVC.player2.playerShape = player2Shape

    }
}
