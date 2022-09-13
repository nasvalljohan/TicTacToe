
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet var buttons: [UIButton]!
    var gameLogic = GameLogic(player1: Player(playerName: "Player 1", score: 0), player2: Player(playerName: "Player 2", score: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPlayAgain.isHidden = true
        // Do any additional setup after loading the view
    }

    @IBAction func playAgainPress(_ sender: Any) {
        gameLogic.resetAfterWin(buttons: buttons)

    }
    @IBAction func onPress(_ sender: UIButton) {
        
        switch sender {
        case buttons[0]:
            gameLogic.buttonPressed(index: 0, buttons: buttons)
            break
        case buttons[1]:
            gameLogic.buttonPressed(index: 1, buttons: buttons)
            break
        case buttons[2]:
            gameLogic.buttonPressed(index: 2, buttons: buttons)
            break
        case buttons[3]:
            gameLogic.buttonPressed(index: 3, buttons: buttons)
            break
        case buttons[4]:
            gameLogic.buttonPressed(index: 4, buttons: buttons)
            break
        case buttons[5]:
            gameLogic.buttonPressed(index: 5, buttons: buttons)
            break
        case buttons[6]:
            gameLogic.buttonPressed(index: 6, buttons: buttons)
            break
        case buttons[7]:
            gameLogic.buttonPressed(index: 7, buttons: buttons)
            break
        case buttons[8]:
            gameLogic.buttonPressed(index: 8, buttons: buttons)
            break
        default:
            return
        }
    }
    
    func uiToggles(){
        
    }
}


// MARK: TODO
// Move anything that alters UI directly into viewcontroller
// Add roundcounter to use in last IF in drawcondition. Instead of !playerturn
// Add player names and inputs
// Add timer for players
