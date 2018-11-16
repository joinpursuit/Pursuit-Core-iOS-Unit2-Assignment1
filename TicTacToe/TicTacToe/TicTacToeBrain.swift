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
    
    public var winMatrix = [
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
            winMatrix[indexToAccessArray][indexToAccessElement] = playerOneMark
        } else{
            winMatrix[indexToAccessArray][indexToAccessElement] = playerTwoMark
        }
        print(winMatrix)
    }
    
    
    var winningX = ["X","X","X"]
    var winningO = ["O", "O", "O"]
 
    
    var playerOneWins = false
    var playerTwoWins = false
    var diagonalOne = [String]()
    var diagonalTwo = [String]()
    func diagonal (a: [[String]]){
        diagonalOne.append(a[0][0])
        diagonalOne.append(a[1][1])
        diagonalOne.append(a[2][2])
        diagonalTwo.append(a[0][2])
        diagonalTwo.append(a[1][1])
        diagonalTwo.append(a[2][0])
        
        if diagonalOne == winningX || diagonalTwo == winningX{
            playerOneWins =  true
            print("player one wins on diagonal")
        } else if diagonalOne == winningO || diagonalTwo == winningO {
            print("player two wins on diagonal")
        }
        
    }
    
    var colZero = [String]()
    var colOne = [String]()
    var colTwo = [String]()
    
    func whoWins (possibleWinningCombinations: [[String]]) {
        diagonal(a: winMatrix)
        for i in 0 ..< possibleWinningCombinations.count {
            switch i{
            case 0:
                if possibleWinningCombinations[i] == winningX {
                    playerOneWins = true
                    print("player one wins on horizontal \(i): \(playerOneWins)")
                }else if possibleWinningCombinations[i] == winningO {
                    playerTwoWins = true
                    print("player two wins on horizontal \(i): \(playerTwoWins)")
                }
            case 1:
                if possibleWinningCombinations[i] == winningX {
                    playerOneWins = true
                    print("player one wins on horizontal one: \(playerOneWins)")
                }else if possibleWinningCombinations[i] == winningO {
                    playerTwoWins = true
                    print("player two wins on horizontal one: \(playerTwoWins)")
                }
                
            case 2:
                if possibleWinningCombinations[i] == winningX {
                    playerOneWins = true
                    print("player one wins on horizontal two: \(playerOneWins)")
                }else if possibleWinningCombinations[i] == winningO {
                    playerTwoWins = true
                    print("player two wins on horizontal two: \(playerTwoWins)")
                }
            default:
                print("Invalid")
            }
            for j in 0 ..< possibleWinningCombinations[i].count{
                switch j{
                case 0:
                    colZero.append(possibleWinningCombinations[i][j])
                    print(colZero)
                    if colZero == winningX {
                        playerOneWins = true
                        print("player one wins on vertical zero: \(playerOneWins)")
                    }else if colZero == winningO {
                        playerTwoWins = true
                        print("player two wins on vertical zero: \(playerTwoWins)")
                    }
                case 1:
                    colOne.append(possibleWinningCombinations[i][j])
                    print(colOne)
                    if colOne == winningX {
                        playerOneWins = true
                        print("player one wins on vertical one: \(playerOneWins)")
                    }else if colOne == winningO {
                        playerTwoWins = true
                        print("player two wins on vertical one: \(playerTwoWins)")
                    }
                case 2:
                    colTwo.append(possibleWinningCombinations[i][j])
                    print(colTwo)
                    if colTwo == winningX {
                        playerOneWins = true
                        print("player one wins on vertical two: \(playerOneWins)")
                    }else if colTwo == winningO {
                        playerTwoWins = true
                        print("player two wins on vertical two: \(playerTwoWins)")
                    }
                default:
                    print("Invalid")
                }
                
            }
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
