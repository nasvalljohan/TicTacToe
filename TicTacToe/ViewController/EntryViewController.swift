//
//  EntryViewController.swift
//  TicTacToe
//
//  Created by Johan Näsvall on 2022-09-16.
//

import UIKit

class EntryViewController: UIViewController {
    
    var entryToGame: String = "entryToGame"

    @IBOutlet weak var inputP2: UITextField!
    @IBOutlet weak var inputP1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == entryToGame {
            let dVC = segue.destination as! ViewController
            dVC.p1NameReceived = inputP1.text
            dVC.p2NameReceived = inputP2.text
        }
    }

    @IBAction func onPress(_ sender: Any) {
        performSegue(withIdentifier: entryToGame, sender: self)
    }
    
}
