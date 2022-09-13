import Foundation
import UIKit

class GameLogic {
    
    // MARK: Game states
    let STATUS_GAME_INACTIVE = -1
    let STATUS_GAME_ACTIVE = 0
    let STATUS_GAME_DRAW = 1
    let STATUS_GAME_PLAYER1WIN = 2
    let STATUS_GAME_PLAYER2WIN = 3
    
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
    func buttonPressed(index: Int, buttons: Array<UIButton>){
        //player 1
        if playerTurn == true && buttons[index].titleLabel?.text == " " {
            buttons[index].setTitle("O", for: .normal)
            buttons[index].titleLabel?.font = .systemFont(ofSize: 80)
            player1Array.append(index)
            //Win condition
            let gameOver = checkWinner(playerArr: player1Array)
            if gameOver == true{
                for button in buttons {
                    button.isUserInteractionEnabled = false
                }
            }
            playerTurn = !playerTurn
            
            //player 2
        }else if playerTurn != true && buttons[index].titleLabel?.text == " "{
            buttons[index].setTitle("X", for: .normal)
            buttons[index].titleLabel?.font =  .systemFont(ofSize: 80)
            player2Array.append(index)
            // Win condition
            let gameOver = checkWinner(playerArr: player2Array)
            if gameOver == true{
                for button in buttons {
                    button.isUserInteractionEnabled = false
                }
            }
            
            playerTurn = !playerTurn
        }
    }
    
    // MARK: CheckWinner
    func checkWinner(playerArr: Array<Int>) -> Bool{
        
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
        print(winConditions.count - drawConditions.count)
        print("NR of drawcond \(drawConditions.count)")
        print("NR of wincond \(winConditions.count)")
        if winConditions.count - drawConditions.count == 1{
            print("its a draw")
            return true
        } else if winConditions.allSatisfy(drawConditions.contains){
           print("its a draw")
            return true
        } else{
            for condition in winConditions{
                if condition.allSatisfy(playerArr.contains){
                    if playerTurn == true {
                        print("player 1 won")
                        player1Won = true
                        player1.score += 1
                        return true
                    }else{
                        print("player 2 won")
                        player2Won = true
                        player2.score += 1
                        return true
                    }
                }
            }
        }
        return false
    }


} // Last close

