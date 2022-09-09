//
//  ViewController.swift
//  TicTacToe
//
//  Created by Johan Näsvall on 2022-09-08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    var playerTurn: Bool = true
    var player1Array: Array<Int>?
    var player2Array: Array<Int>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onPress(_ sender: UIButton) {
        switch sender {
        case buttons[0]:
            print("buttons 0")
            buttonPressed(index: 0)
            break
        case buttons[1]:
            print("buttons 1")
            buttonPressed(index: 1)
            break
        case buttons[2]:
            print("buttons 2")
            buttonPressed(index: 2)
            break
        case buttons[3]:
            print("buttons 3")
            buttonPressed(index: 3)
            break
        case buttons[4]:
            print("buttons 4")
            buttonPressed(index: 4)
            break
        case buttons[5]:
            print("buttons 5")
            buttonPressed(index: 5)
            break
        case buttons[6]:
            print("buttons 6")
            buttonPressed(index: 6)
            break
        case buttons[7]:
            print("buttons 7")
            buttonPressed(index: 7)
            break
        case buttons[8]:
            print("buttons 8")
            buttonPressed(index: 8)
            break
        default:
            return
        }
    }
    func buttonPressed(index: Int){
        if playerTurn == true && buttons[index].titleLabel?.text == nil{
            buttons[index].setTitle("O", for: .normal)
            playerTurn = !playerTurn
            if (player1Array?.append(index)) == nil {
                player1Array = [index]
            }
            
        }else if playerTurn != true && buttons[index].titleLabel?.text == nil{
            buttons[index].setTitle("X", for: .normal)
            playerTurn = !playerTurn
            if (player2Array?.append(index)) == nil {
                player2Array = [index]
            }
            
        }
    }
}

