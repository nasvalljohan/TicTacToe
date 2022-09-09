
import Foundation
import UIKit

class GameLogic {
    
    var playerTurn: Bool = true
    var player1Array: Array<Int>?
    var player2Array: Array<Int>?
    
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
                checkWinner(userArray: player1Array ?? [])
            } else{
                checkWinner(userArray: player1Array ?? [])
            }
            
        }else if playerTurn != true && buttons[index].titleLabel?.text == nil{
            buttons[index].setTitle("X", for: .normal)
            playerTurn = !playerTurn
            buttons[index].titleLabel?.font =  .systemFont(ofSize: 80)
            if (player2Array?.append(index)) == nil {
                player2Array = [index]
                checkWinner(userArray: player2Array ?? [])
            } else{
                checkWinner(userArray: player2Array ?? [])
            }
        }
    }
    func checkWinner(userArray: Array<Int>){
        for condition in winConditions{
            if condition.allSatisfy(userArray.contains){
                print("winner")
            }
        }
    }
    func resetGame(index: Int, btns: Array<UIButton>){
        playerTurn = true
        for _ in btns{
            btns[index].setTitle("", for: .normal)
        }
        player1Array?.removeAll()
        player2Array?.removeAll()
    }
}
