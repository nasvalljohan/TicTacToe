import Foundation
import UIKit

class GameLogic {
    
    var player1: Player = Player(playerName: "Player 1", score: 0)
    var player2: Player = Player(playerName: "Player 2", score: 0)
    
    
    var playerTurn: Bool = true
    var player1Array: Array<Int> = []
    var player2Array: Array<Int> = []
    var player1Won: Bool = false
    var player2Won: Bool = false
    var gameDraw: Bool = false
    var drawConditions: Array<Array<Int>> = [[0]]
    var winConditions: Array<Array<Int>> = [
            [0, 1, 2], // 0
            [3, 4, 5], // 1
            [6, 7, 9], // 2
            [0, 3, 6], // 3
            [1, 4, 7], // 4
            [2, 5, 8], // 5
            [0, 4, 8], // 6
            [2, 4, 6]] // 7
    
    func resetAfterWin(buttons: Array<UIButton>){
        if player1Won{
            player1.score += 1
        }else if player2Won{
            player2.score += 1
        }
        player1Won = false
        player1Array = []
        player2Array = []
        player2Won = false
        gameDraw = false
        for i in 0...8 {
            buttons[i].setTitle(" ", for: .normal)
        }
    }
    
    func buttonPressed(index: Int, buttons: Array<UIButton>){
        //player 1
        if playerTurn == true && buttons[index].titleLabel?.text == " " {
            buttons[index].setTitle("O", for: .normal)
            buttons[index].titleLabel?.font = .systemFont(ofSize: 80)
            playerTurn = !playerTurn
            player1Array.append(index)
            //Win condition
            checkWinner(playerArr: player1Array)
            
            //player 2
        }else if playerTurn != true && buttons[index].titleLabel?.text == " "{
            buttons[index].setTitle("X", for: .normal)
            playerTurn = !playerTurn
            buttons[index].titleLabel?.font =  .systemFont(ofSize: 80)
            player2Array.append(index)
            // Win condition
            checkWinner(playerArr: player2Array)
        }
    }
    
    func checkWinner(playerArr: Array<Int>) {
        tryDraw()
        for condition in winConditions{
            if condition.allSatisfy(playerArr.contains){
                if playerTurn == true {
                    player1Won = true
                }else {
                    player2Won = true
                }
            }
        }
    }
    
    func tryDraw() {
        //Index of inner array
        for (_, condition) in winConditions.enumerated() {
            // Elements of inner array
            for _ in condition{
                
                // Does playerarrays contain numbers from same wincondition?
                // if yes add that winCondition to drawCondition
                if player1Array.contains(condition[0]) && player2Array.contains(condition[1]) || player1Array.contains(condition[1]) && player2Array.contains(condition[0]){

                    for _ in winConditions{
                        if drawConditions.contains(condition){}else {drawConditions.append(condition)}
                    }
                    
                // 1-2 2-1 <- Possible combination - Same as above diff index in condition
                } else if player1Array.contains(condition[1]) && player2Array.contains(condition[2]) || player1Array.contains(condition[2]) && player2Array.contains(condition[1]){
                    for _ in winConditions{if drawConditions.contains(condition){}else {drawConditions.append(condition)}}
                }
                
                // 2-0 0-2 <- Possible combination - Same as above diff index in condition
                else if player1Array.contains(condition[0]) && player2Array.contains(condition[2]) || player1Array.contains(condition[2]) && player2Array.contains(condition[0]){
                    for _ in winConditions{if drawConditions.contains(condition){}else {drawConditions.append(condition)}}
                }
            }
        }
        if drawConditions.count == 8 || drawConditions.count > 7 && !playerTurn {
            gameDraw = true
            
        }
    }

}
// MARK: TODO
// Add something to stop inputs on playfield on win/draw
// Add player names and inputs
// Add timer for players
