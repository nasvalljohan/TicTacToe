//
//  EntryViewController.swift
//  TicTacToe
//
//  Created by Johan Näsvall on 2022-09-16.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet weak var btnNext: UIButton!
    var entryToGame: String = "entryToGame"

    @IBOutlet weak var lblSwitch: UILabel!
    @IBOutlet weak var uiSwitch: UISwitch!
    @IBOutlet weak var lblP1: UILabel!
    @IBOutlet weak var lblP2: UILabel!
    @IBOutlet weak var inputP2: UITextField!
    @IBOutlet weak var inputP1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblSwitch.text = "VS Player"
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == entryToGame {
            let dVC = segue.destination as! ViewController

            
            if uiSwitch.isOn{
                if inputP1.text == "" || inputP2.text == ""{
                    dVC.p1NameReceived = "Player 1"
                    dVC.p2NameReceived = "Player 2"
                } else{
                    dVC.p1NameReceived = inputP1.text
                    dVC.p2NameReceived = inputP2.text
                }
            } else
            {
                dVC.p2NameReceived = "MR Computer"
                
                
                if inputP1.text == "" {
                    dVC.p1NameReceived = "Player 1"
                } else
                {
                    dVC.p1NameReceived = inputP1.text
                }
            }

        }
    }
    
    @IBAction func onSwitch(_ sender: Any) {
        if uiSwitch.isOn {
            lblSwitch.text = "VS Player"
            lblP2.isHidden = false
            inputP2.isHidden = false
        } else {
            lblSwitch.text = "VS Computer"
            inputP2.isHidden = true
            lblP2.isHidden = true
        }
    }
    @IBAction func onPress(_ sender: Any) {
        performSegue(withIdentifier: entryToGame, sender: self)
    }
    
}
