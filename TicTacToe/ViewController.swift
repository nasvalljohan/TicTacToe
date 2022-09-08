//
//  ViewController.swift
//  TicTacToe
//
//  Created by Johan Näsvall on 2022-09-08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func onPress(_ sender: UIButton) {

        switch sender {
        case buttons[0]:
            print("buttons 1")
            break
        case buttons[1]:
            print("buttons 2")
            break
        case buttons[2]:
            print("buttons 3")
            break
        case buttons[3]:
            print("buttons 4")
            break
        case buttons[4]:
            print("buttons 5")
            break
        case buttons[5]:
            print("buttons 6")
            break
        case buttons[6]:
            print("buttons 7")
            break
        case buttons[7]:
            print("buttons 8")
            break
        case buttons[8]:
            print("buttons 9")
            break
        default:
            return
        }
    }
}

