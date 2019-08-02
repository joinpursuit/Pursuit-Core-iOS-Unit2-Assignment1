

import UIKit

class ViewController: UIViewController {
// 9 IBlabels for displaying X & O when an IBAction is triggered
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    
    @IBOutlet var buttonArray: [UIButton]!
    
    
    
    //  Label for printing a mesaage to the MVC
    @IBOutlet weak var playersTurn: UILabel!
    // Label for printing how many turns are left after a user triggers an IBAction
    @IBOutlet weak var turnsLeft: UILabel!
    var xArray = ["X", "X", "X"]
    var oArray = ["O", "O", "O"]
    var uiLabelArray:[UILabel] = []
    var allButtons:[UIButton] = []
    var possibleOutcomesUILabels: [[UILabel]] = [[]]
    
    // an instance of the TicTacToeBrain Class
    var ticTacToeBrain = TicTacToeBrain()
    var currentPlayer: PlayerSelector = .playerOne
    
    override func viewDidLoad() {
        
    super.viewDidLoad()
        // this sets all Labels to an array once the program starts
        uiLabelArray = [label1,label2,label3,label4,label5,label6,label7,label8,label9]
        possibleOutcomesUILabels = [[label1,label2,label3],
                                    [label4,label5,label6] , [label7,label8,label9], [label1,label5,label9],  [label2,label5,label8],[label3,label6,label9],[label3,label5,label7],
                                        [label1,label4,label7]]
    // sets the alpha of each label in the array to 0 to be not visible
        uiLabelArray.forEach({$0.alpha = 0})
        // Displayed text when game starts
        playersTurn.text = "Player One Start"
        // sets the alpha to 0 to be not visible
        turnsLeft.alpha = 0
  }
//    func replace() {
//        for label in uiLabelArray where label.text == "" {
//            label.text = "X"
//            label.alpha = 0
//    }
//    }
    func disableButtons() {
      buttonArray.forEach({$0.isEnabled = false})
    }

    func enableButtons() {
      buttonArray.forEach({$0.isEnabled = true})
    }
    
    // this function makes (turnsLeft) visible.
    //sets the amount of moves left based on how many IBActions (buttons) are left.
    func howManyTurnsAreLeftFunc(){
        turnsLeft.alpha = 1
        switch allButtons.count{
        case 1...7:
            turnsLeft.text = "There are \(9 - allButtons.count) moves left"
        case 8:
            turnsLeft.text = "There Is only \(9 - allButtons.count) move left"
        default:
            turnsLeft.text = "There are no more moves left"
        }
    }
    
    func winCondition()  {
        for wins in possibleOutcomesUILabels {
            if xArray.contains(wins[0].text!) && xArray.contains(wins[1].text!) && xArray.contains(wins[2].text!)   {
                playersTurn.text = " \(ticTacToeBrain.playerArray[0]) wins!"
                disableButtons()
            }
            else if oArray.contains(wins[0].text!) && oArray.contains(wins[1].text!) && oArray.contains(wins[2].text!)   {

                playersTurn.text = " \(ticTacToeBrain.playerArray[1]) wins!"
               disableButtons()
            
            } else if allButtons.count == 9 {
                playersTurn.text = "The game is a draw!"
            }
    }
    }
    

    @IBAction func ticTacToeButtons(_ sender: UIButton) {
        
        switch currentPlayer{
        case.playerOne:

            uiLabelArray[sender.tag].text = "X"
            uiLabelArray[sender.tag].alpha = 1
            sender.isEnabled = false
            allButtons += [sender]
            playersTurn.text = "\(ticTacToeBrain.playerArray[1])'s turn"
            howManyTurnsAreLeftFunc()
            currentPlayer = .playerTwo
            winCondition()
            
        case .playerTwo:

            uiLabelArray[sender.tag].text = "O"
            uiLabelArray[sender.tag].alpha = 1
            sender.isEnabled = false
            allButtons += [sender]
            playersTurn.text = "\(ticTacToeBrain.playerArray[0])'s turn"
            howManyTurnsAreLeftFunc()
            currentPlayer = .playerOne
            winCondition()
        }
        }
    
    @IBAction func newGame(_ sender: UIButton) {

        uiLabelArray.forEach({$0.alpha = 0})
        uiLabelArray.forEach({$0.text = ""})
        allButtons.forEach({$0.isEnabled = true})
        allButtons = []
        playersTurn.text = "Player One Start"
        turnsLeft.alpha = 0
        currentPlayer = .playerOne
        
       enableButtons()
}
}

