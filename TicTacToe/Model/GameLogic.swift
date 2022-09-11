
import Foundation
import UIKit

class GameLogic {
    
    var playerTurn: Bool = true
    var player1Array: Array<Int>?
    var player2Array: Array<Int>?
    var playerWon: Bool?
    
    var winConditions: Array<Array<Int>> = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 9],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]]
    
    
    func buttonPressed(index: Int, buttons: Array<UIButton>){
        if playerTurn == true && buttons[index].titleLabel?.text == nil {
            buttons[index].setTitle("O", for: .normal)
            buttons[index].titleLabel?.font = .systemFont(ofSize: 80)
            playerTurn = !playerTurn
            if (player1Array?.append(index)) == nil {
                player1Array = [index]
                _ = checkWinner(userArray: player1Array ?? [])
            } else{
                playerWon = checkWinner(userArray: player1Array ?? [])
            }
            
        }else if playerTurn != true && buttons[index].titleLabel?.text == nil{
            buttons[index].setTitle("X", for: .normal)
            playerTurn = !playerTurn
            buttons[index].titleLabel?.font =  .systemFont(ofSize: 80)
            if (player2Array?.append(index)) == nil {
                player2Array = [index]
                _ = checkWinner(userArray: player2Array ?? [])
            } else{
                playerWon = checkWinner(userArray: player2Array ?? [])
            }
        }
    }
    
    func checkWinner(userArray: Array<Int>) -> Bool{
        for condition in winConditions{
            if condition.allSatisfy(userArray.contains){
                return true
            }
        }
        return false
    }
    
    func resetGame(buttons: [UIButton]){
        if playerWon == true{
            print("We got a winner now")
        }else{
            print("No winner yet")
        }
        
    }
}
// MARK: TODO:
// Possible to move checkWinner() into buttonPressed()?
// Add Draw
// Add player names and inputs
// Add timer for players
