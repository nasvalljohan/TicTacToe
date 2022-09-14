
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet var buttons: [UIButton]!
    var gameLogic = GameLogic(player1: Player(playerName: "Player 1", score: 0), player2: Player(playerName: "Player 2", score: 0))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }

    @IBAction func playAgainPress(_ sender: Any) {
        gameLogic.resetAfterWin(buttons: buttons)

    }
    @IBAction func onPress(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            gameLogic.buttonPressed(tag: 0)
            uiToggles(tag: sender.tag)
            break
        case 1:
            gameLogic.buttonPressed(tag: 1)
            uiToggles(tag: sender.tag)
            break
        case 2:
            gameLogic.buttonPressed(tag: 2)
            uiToggles(tag: sender.tag)
            break
        case 3:
            gameLogic.buttonPressed(tag: 3)
            uiToggles(tag: sender.tag)
            break
        case 4:
            gameLogic.buttonPressed(tag: 4)
            uiToggles(tag: sender.tag)
            break
        case 5:
            gameLogic.buttonPressed(tag: 5)
            uiToggles(tag: sender.tag)
            break
        case 6:
            gameLogic.buttonPressed(tag: 6)
            uiToggles(tag: sender.tag)
            break
        case 7:
            gameLogic.buttonPressed(tag: 7)
            uiToggles(tag: sender.tag)
            break
        case 8:
            gameLogic.buttonPressed(tag: 8)
            uiToggles(tag: sender.tag)
            break
        default:
            return
        }
    }
    
    func uiToggles(tag: Int){
        //player 1
        if gameLogic.playerTurn == true && buttons[tag].titleLabel?.text == " " {
            buttons[tag].setTitle("X", for: .normal)
            buttons[tag].titleLabel?.font = .systemFont(ofSize: 80)
            //player 2
        }else if gameLogic.playerTurn != true && buttons[tag].titleLabel?.text == " "{
            buttons[tag].setTitle("O", for: .normal)
            buttons[tag].titleLabel?.font =  .systemFont(ofSize: 80)

        }
    }
}


// MARK: TODO
// Move button changes X & O
// Add roundcounter to use in last IF in drawcondition. Instead of !playerturn
// Add player names and inputs
// Add timer for players
