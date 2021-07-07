//
//  ViewController.swift
//  TicTacToe
//
//  Created by EricM on 7/31/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var winner: UILabel!
    
    @IBOutlet weak var b0: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    
        @IBAction func choice(_ sender: UIButton) {
            turnCount += 1
            switch sender.tag{
            case 0:
                b0.setTitle(playersButtonChange(), for: UIControl.State.normal)
                button1.btn = sender.tag
                button1.title = playersButtonChange()
                 b0.isEnabled = false
                break
            case 1:
                b1.setTitle(playersButtonChange(), for: UIControl.State.normal)
                button2.btn = sender.tag
                button2.title = playersButtonChange()
                 b1.isEnabled = false
                break
            case 2:
                b2.setTitle(playersButtonChange(), for: UIControl.State.normal)
                button3.btn = sender.tag
                button3.title = playersButtonChange()
                 b2.isEnabled = false
                break
            case 3:
                b3.setTitle(playersButtonChange(), for: UIControl.State.normal)
                button4.btn = sender.tag
                button4.title = playersButtonChange()
                 b3.isEnabled = false
                break
            case 4:
                b4.setTitle(playersButtonChange(), for: UIControl.State.normal)
                button5.btn = sender.tag
                button5.title = playersButtonChange()
                 b4.isEnabled = false
                break
            case 5:
                b5.setTitle(playersButtonChange(), for: UIControl.State.normal)
                button6.btn = sender.tag
                button6.title = playersButtonChange()
                 b5.isEnabled = false
                break
            case 6:
                b6.setTitle(playersButtonChange(), for: UIControl.State.normal)
                button7.btn = sender.tag
                button7.title = playersButtonChange()
                 b6.isEnabled = false
                break
            case 7:
                b7.setTitle(playersButtonChange(), for: UIControl.State.normal)
                button8.btn = sender.tag
                button8.title = playersButtonChange()
                 b7.isEnabled = false
                break
            case 8:
                b8.setTitle(playersButtonChange(), for: UIControl.State.normal)
                button9.btn = sender.tag
                button9.title = playersButtonChange()
                b8.isEnabled = false
                break
            default:
                message.text = "If you get this message that means you broke it"
                break
            }
            
            func compare (a:TicTacToeBrain,a2: TicTacToeBrain, a3: TicTacToeBrain)->Bool{
                return a.title == a2.title && a.title == a3.title && a.title != ""                    //disable(true)
            }
            
            func allConditions(){
                if compare(a: button1, a2: button2, a3: button3){
                    winner.text = "You win"
                }
                else if compare(a: button4, a2: button5, a3: button6){
                    winner.text = "You win"
                }
                else if compare(a: button7, a2: button8, a3: button9){
                    winner.text = "You win"
                }
                else if compare(a: button1, a2: button4, a3: button6){
                    winner.text = "You win"
                }
                else if compare(a: button2, a2: button5, a3: button8){
                    winner.text = "You win"
                }
                else if compare(a: button3, a2: button6, a3: button9){
                    winner.text = "You win"
                }
                else if compare(a: button1, a2: button5, a3: button9){
                    winner.text = "You win"
                }
                else if compare(a: button3, a2: button5, a3: button7){
                    winner.text = "You win"
                }
            }
            
            checkTurn()
            allConditions()
        }
    
    var turnCount = 0
    func checkTurn(){
        if turnCount % 2 == 0{
            message.text = "Player1 Turn"
        }
        else{
            message.text = "Player2 Turn"
        }
    }
    
    func playersButtonChange()->String{
        if turnCount % 2 == 0{
            return "X"
        }
        else{
            return "0"
        }
        
    }
    func disable(_ a: Bool){
        if a == true {
            b0.isEnabled = false
            b1.isEnabled = false
            b2.isEnabled = false
            b3.isEnabled = false
            b4.isEnabled = false
            b5.isEnabled = false
            b6.isEnabled = false
            b7.isEnabled = false
            b8.isEnabled = false
        }
        else{
            b0.isEnabled = true
            b1.isEnabled = true
            b2.isEnabled = true
            b3.isEnabled = true
            b4.isEnabled = true
            b5.isEnabled = true
            b6.isEnabled = true
            b7.isEnabled = true
            b8.isEnabled = true
        }
//        for tag in 0...8{
//            let button = self.view.viewWithTag(tag) as! UIButton
//            button.isEnabled = false
        }
    
    func refreshButtons(){
        b0.setTitle("", for: UIControl.State.normal)
        b1.setTitle("", for: UIControl.State.normal)
        b2.setTitle("", for: UIControl.State.normal)
        b3.setTitle("", for: UIControl.State.normal)
        b4.setTitle("", for: UIControl.State.normal)
        b5.setTitle("", for: UIControl.State.normal)
        b6.setTitle("", for: UIControl.State.normal)
        b7.setTitle("", for: UIControl.State.normal)
        b8.setTitle("", for: UIControl.State.normal)
    }
    func refreshBtns(){
        for i in buttonList{
            i.title = ""
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        turnCount = 0
        refreshButtons()
        refreshBtns()
        disable(false)
        message.text = "Player 1 is 0"
        winner.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = "Player 1 is 0"
        // Do any additional setup after loading the view.
    }
    
    
}

