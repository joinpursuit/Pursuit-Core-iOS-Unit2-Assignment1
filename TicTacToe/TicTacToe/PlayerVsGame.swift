

import UIKit

class PlayerVsGame: UIViewController {
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
    @IBOutlet weak var newGameButtonOutlet: UIButton!
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    @IBOutlet var back: UIButton!
    @IBOutlet var buttonArray: [UIButton]!
    @IBOutlet var viewBackGround: UIView!
    @IBOutlet var mainImageView: UIImageView!
    let mainViewImage = UIImage(named: "computer")
    var xArray = "X"
    var oArray = "O"
    static var player1Score:Int = 0
    static var player2Score:Int = 0
    
    var player = "Player One"
    //  Label for printing a mesaage to the MVC
    @IBOutlet weak var playersTurn: UILabel!
    // Label for printing how many turns are left after a user triggers an IBAction
    @IBOutlet weak var turnsLeft: UILabel!
    var uiLabelArray:[UILabel] = []
    var allButtons:[UIButton] = []
    var possibleOutcomesUILabels: [[UILabel]] = [[]]
    
  
    var currentPlayer: PlayerSelector = .playerOne
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this sets all Labels to an array once the program starts
        uiLabelArray = [label1,label2,label3,label4,label5,label6,label7,label8,label9]
        
        possibleOutcomesUILabels = [[label1,label2,label3],
                                    [label4,label5,label6] , [label7,label8,label9], [label1,label5,label9],  [label2,label5,label8],[label3,label6,label9],[label3,label5,label7],
                                    [label1,label4,label7]]
        
        mainImageView.image = mainViewImage
        // sets the alpha of each label in the array to 0 to be not visible
        uiLabelArray.forEach({$0.alpha = 0})
        // Displayed text when game starts
        playersTurn.text = "Player One Start"
        // sets the alpha to 0 to be not visible
        turnsLeft.alpha = 0
        newGameButtonOutlet.alpha = 0
        
        playerOneScore.text = "\(player): \(ViewController.player1Score)"
        playerTwoScore.text = "Computer: \(ViewController.player2Score)"
        
    }
    
    func makeNewGameButtonVisible(){
        newGameButtonOutlet.alpha = 1
    }
    
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
            
            if xArray.contains(wins[0].text!) && xArray.contains(wins[1].text!) && xArray.contains(wins[2].text!){
                playersTurn.text = " \(player) wins!"
                disableButtons()
                viewBackGround.backgroundColor = UIColor.purple
                makeNewGameButtonVisible()
                ViewController.player1Score += 1
                playerOneScore.text = "\(player): \(ViewController.player1Score)"
                break
            }
            else if oArray.contains(wins[0].text!) && oArray.contains(wins[1].text!) && oArray.contains(wins[2].text!){
                playersTurn.text = " Computer wins!"
                disableButtons()
                viewBackGround.backgroundColor = UIColor.blue
                makeNewGameButtonVisible()
                ViewController.player2Score += 1
                playerTwoScore.text = "Computer: \(ViewController.player2Score)"
                break
            } else {
                
                if allButtons.count == 9{
                    playersTurn.text = "The game is a draw!"
                    viewBackGround.backgroundColor = UIColor.red
                    makeNewGameButtonVisible()
                }
            }
        }
    }
    
    @IBAction func ticTacToeButtons(_ sender: UIButton) {
        
        switch currentPlayer{
        case.playerOne:
            uiLabelArray[sender.tag].text = currentPlayer.playersSymbol()
            uiLabelArray[sender.tag].alpha = 1
            sender.isEnabled = false
            allButtons += [sender]
            playersTurn.text = "Computers's turn"
            howManyTurnsAreLeftFunc()
            currentPlayer = .playerTwo
            winCondition()
            
        case .playerTwo:
            uiLabelArray[sender.tag].text = currentPlayer.playersSymbol()
            uiLabelArray[sender.tag].alpha = 1
            sender.isEnabled = false
            allButtons += [sender]
            playersTurn.text = "\(player)'s turn"
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
        viewBackGround.backgroundColor = UIColor.black
        newGameButtonOutlet.alpha = 0
    }
}


