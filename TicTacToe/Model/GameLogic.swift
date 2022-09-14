import Foundation
import UIKit

class GameLogic {
    
    var CURRENT_GAME_STATE: Int = 0
    
    // MARK: Instances
    var player1: Player
    var player2: Player
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    // MARK: Variables
    var playerTurn: Bool = true
    var roundCounter: Int = 0
    var player1Array: Array<Int> = []
    var player2Array: Array<Int> = []
    var player1Won: Bool = false
    var player2Won: Bool = false
    var drawConditions: Array<Array<Int>> = []
    var winConditions: Array<Array<Int>> = [
        [0, 1, 2], // 0
        [3, 4, 5], // 1
        [6, 7, 8], // 2
        [0, 3, 6], // 3
        [1, 4, 7], // 4
        [2, 5, 8], // 5
        [0, 4, 8], // 6
        [2, 4, 6]] // 7
    
    // MARK: ResetAfterWin
    func resetAfterWin(buttons: Array<UIButton>){
        player1Won = false
        player2Won = false
        player1Array = []
        player2Array = []
        roundCounter += 1
        drawConditions = []
        for button in buttons{
            button.setTitle(" ", for: .normal)
            button.isUserInteractionEnabled = true
        }
        print("Current round is: \(roundCounter)")
        print("Player 1 score is: \(player1.score)")
        print("Player 2 score is: \(player2.score)")
        
    }
    
    // MARK: ButtonPressed
    func buttonPressed(tag: Int){
        //player 1
        if playerTurn == true{
            player1Array.append(tag)
            checkWinner(playerArr: player1Array)
            playerTurn = false
            
            //player 2
        }else if playerTurn != true{
            player2Array.append(tag)
            checkWinner(playerArr: player2Array)
            playerTurn = true
        }
    }
    
    // MARK: CheckWinner, contains no UI
    func checkWinner(playerArr: Array<Int>){
        
        for (_, condition) in winConditions.enumerated() {
            // Elements of inner array
            for _ in condition{
                // Does playerarrays contain numbers from same wincondition?
                // if yes add that winCondition to drawCondition
                if player1Array.contains(condition[0]) && player2Array.contains(condition[1]) || player1Array.contains(condition[1]) && player2Array.contains(condition[0]){
        
                    for _ in winConditions{
                        if drawConditions.contains(condition){
                        }else {
                            drawConditions.append(condition)
                        }
                    }
        
                    // 1-2 2-1 <- Possible combination - Same as above diff index in condition
                } else if player1Array.contains(condition[1]) && player2Array.contains(condition[2]) || player1Array.contains(condition[2]) && player2Array.contains(condition[1]){
        
                    for _ in winConditions{
                        if drawConditions.contains(condition){
                        }else {
                            drawConditions.append(condition)
                        }
                    }
                }
        
                // 2-0 0-2 <- Possible combination - Same as above diff index in condition
                else if player1Array.contains(condition[0]) && player2Array.contains(condition[2]) || player1Array.contains(condition[2]) && player2Array.contains(condition[0]){
        
                    for _ in winConditions{
                        if drawConditions.contains(condition){
                        }else {
                            drawConditions.append(condition)
                        }
                    }
                }
            }
        }
        if winConditions.count - drawConditions.count == 0 {
            print("its a draw, cond - cond = 0")
        } else if winConditions.allSatisfy(drawConditions.contains){
           print("its a draw, cond allsatisfy cond contain")
        } else{
            for condition in winConditions{
                if condition.allSatisfy(playerArr.contains){
                    if playerTurn == true {
                        print("player 1 won")
                        player1Won = true
                    }else{
                        print("player 2 won")
                        player2Won = true
                    }
                }
            }
        }
    }
} // Last close

