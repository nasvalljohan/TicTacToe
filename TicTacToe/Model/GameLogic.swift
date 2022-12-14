import Foundation
import UIKit

class GameLogic {
    
    var CURRENT_GAME_STATE: Int = 0
    var GAME_STATUS_PLAYER1WON: Int = 1
    var GAME_STATUS_PLAYER2WON: Int = 2
    var GAME_STATUS_GAMEDRAW: Int = -1
    var GAME_STATUS_PLAYER1TURN: Int = 11
    var GAME_STATUS_PLAYER2TURN: Int = 22

    var player1: Player
    var player2: Player
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    var playerTurn: Bool = true
    var boardArray: Array<Int> = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var computerMove: Array<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    var player1Array: Array<Int> = []
    var player2Array: Array<Int> = []
    var drawConditions: Array<Array<Int>> = []
    var winConditions: Array<Array<Int>> = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    
    // MARK: Func
    // Resetting variables, called same time as UI reset from viewcontroller
    func resetAfterWin(){
        player1Array = []
        player2Array = []
        drawConditions = []
        CURRENT_GAME_STATE = 0
        boardArray = [0,0,0,0,0,0,0,0,0]
    }
    
    // Called every buttonpress, tag is buttonID 
    func switchTurn(tag: Int) -> Int{
        //Player 1
        if playerTurn == true{
            player1Array.append(tag)
            playerTurn = false
            boardArray[tag] = 1
            return tag
        }
        // If player 2 is computer
        if player2.vsComputer && playerTurn == false {
            let randomInt: Int = computerMove.randomElement()!
            if boardArray[randomInt] == 0 {
                boardArray[randomInt] = 1
                player2Array.append(randomInt)
                playerTurn = true
                return randomInt
            }
            return switchTurn(tag: tag) // go again if boardarray @randomint == 0
        }
        // Player 2
        if playerTurn == false{
            player2Array.append(tag)
            playerTurn = true
            return tag
        }
        return 0
    }
    
    
    // Only checking if we have a winner or if game is draw
    func buttonPressed() -> Int{
        
        // Checkwinner only returns 0, 1, 2 or -1
        let result = checkWinner(playerArr: playerTurn ? player2Array : player1Array)

        if result != 0 {
            CURRENT_GAME_STATE = result
            return CURRENT_GAME_STATE
        }
        if playerTurn == true {
            CURRENT_GAME_STATE = GAME_STATUS_PLAYER1TURN
        } else {
            CURRENT_GAME_STATE = GAME_STATUS_PLAYER2TURN
        }
        return CURRENT_GAME_STATE
    }
    
    // MARK: CheckWinner
    
    // Checks if playerarrays contains 1 number from same wincondition
    // if yes add winCondition to drawCondition
    func checkWinner(playerArr: Array<Int>) -> Int{
        for (_, condition) in winConditions.enumerated() {
            for _ in condition{
                
                if player1Array.contains(condition[0]) && player2Array.contains(condition[1]) || player1Array.contains(condition[1]) && player2Array.contains(condition[0]){
                    
                    for _ in winConditions{
                        if drawConditions.contains(condition){}else {drawConditions.append(condition)}
                    }
                }
                // 1-2 2-1 <- Possible combination - Same as above diff index in condition
                else if player1Array.contains(condition[1]) && player2Array.contains(condition[2]) || player1Array.contains(condition[2]) && player2Array.contains(condition[1]){
                    
                    for _ in winConditions{
                        if drawConditions.contains(condition){}else {drawConditions.append(condition)}
                    }
                }
                // 2-0 0-2 <- Possible combination - Same as above diff index in condition
                else if player1Array.contains(condition[0]) && player2Array.contains(condition[2]) || player1Array.contains(condition[2]) && player2Array.contains(condition[0]){
                    
                    for _ in winConditions{
                        if drawConditions.contains(condition){}else {drawConditions.append(condition)}
                    }
                }
            }
        }
        
        // Checks if win or draw
        if winConditions.count - drawConditions.count == 0 {
            return GAME_STATUS_GAMEDRAW
        } else if winConditions.allSatisfy(drawConditions.contains){
            return GAME_STATUS_GAMEDRAW
        } else{
            for condition in winConditions{
                if condition.allSatisfy(playerArr.contains){
                    if playerTurn == true {
                        player2.score += 1
                        return GAME_STATUS_PLAYER2WON
                    }else{
                        player1.score += 1
                        return GAME_STATUS_PLAYER1WON
                    }
                }
            }
        }
        return 0
    }
} // Last close

