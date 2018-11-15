//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


class TicTacToeBrain {

    
    public var playerImage: UIImage!
    public var playerMessage = "Your turn"
    private var playerOneTurn = true
    
    public func play(move: (row: Int, col: Int)) {
        print("row: \(move.row), col: \(move.col)")
        if playerOneTurn {
            playerOneTurn = false
            self.playerImage = UIImage(named: "xMark")
        } else {
            playerOneTurn = true
            self.playerImage = UIImage(named: "circle")
        }
        self.playerMessage = playerOneTurn ? "Player One you are on" : "Player Two you are on"
    }
 
        public var winningMatrix = [
        /*position 0*/ ["","",""],
        /*position 1*/ ["","",""],
        /*position 2*/ ["","",""]
    ]
    
    var indexToAccessArray = 0
    var indexToAccessElement = 0
    let  playerOneMark = "O"
    let playerTwoMark = "X"
    func keepTracKInWinningarray (ticToeIndex: (row:Int, col:Int)){
        
        indexToAccessArray = ticToeIndex.row
        indexToAccessElement = ticToeIndex.col
        
        if playerOneTurn{
            winningMatrix[indexToAccessArray][indexToAccessElement] = playerOneMark
        } else{
            winningMatrix[indexToAccessArray][indexToAccessElement] = playerTwoMark
        }
        print(winningMatrix)
    }
    
    var playerOneWins = false
    var playerTwoWins = false
    
    func whoWins (possibleWinningCombinations: [[String]]) {
        outer: for combination in possibleWinningCombinations{
            switchLoop: switch combination{
            case ["X", "X", "X"]:
                playerOneWins = true
                print("player one wins? \(playerOneWins)")
                break
            case  ["O", "O", "O"]:
                playerTwoWins = true
                print("player two wins? \(playerTwoWins)")
                break
            default:
                print("Not a winning combination")
            }
            print(combination)
        }
        
    }
    
    func disableGame (array: [GameButton]){
        for button in array{
         button.isEnabled = false
        }
    }
    
 
    //who wins
    //Calculate diagonal win accessing tag or index, similar to siagonal sum with Brian from twitter
    
    //calculate vertical win with Gamebutton, array of coordinate?
//    array winningPatterns= [[currentButton.row, currentButton.column],[currentButton.row, currentButton.column],[currentButton.row, currentButton.column]]
    
    /*
     winning combination
    horizontal
    [0,0][0,1][0,2]
    [1,0][1,1][1,2]
    [2,0][2,1][2,2]
    
    vertical
    [0,0][1,0][2,0]
    [1,0][1,1][1,2]
    [2,0][2,1][2,2]
    
    diagonal
    [0,0][1,1][2,2]
    [0,2][1,1][2,0]
    
     
     var player1 = 1
     var player2 = 2
     
     I'll need to keep track of each player's selection - store in variable?
     if a winning combination is reached
     identify who is the winning player
     update instruction label to winning message
    */
    
    /*
     winning logic with tags:
     1,2,3
     4,5,6
     7,8,9
     
     1,4,7
     2,5,8
     3,6,9
     
     1,5,9
     7,5,3
     wwaaait.. I think I began tags at 0
 */
    
    
    //counterPlayerOne:
    //counterPlayerTwo:
//}




//    enum PlayerPicture: String {
//        case xMark
//        case circle
//
//        func image() -> UIImage{
//            var cardImage: UIImage!
//            switch self{
//            case .circle:
//                cardImage = UIImage(named: PlayerPicture.circle.rawValue)
//            case .xMark:
//                cardImage = UIImage(named: PlayerPicture.xMark.rawValue)
//
//            }
//            return cardImage
//        }
//    }

//    var image: UIImage
//
//    init(image: UIImage){
//        self.image = image
//    }
}
