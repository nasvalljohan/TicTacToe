
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    var gameLogic = GameLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }

    @IBAction func onPress(_ sender: UIButton) {
        switch sender {
        case buttons[0]:
            gameLogic.buttonPressed(index: 0, buttons: buttons)
            gameLogic.resetGame(buttons: buttons)
            break
        case buttons[1]:
            gameLogic.buttonPressed(index: 1, buttons: buttons)
            gameLogic.resetGame(buttons: buttons)
            break
        case buttons[2]:
            gameLogic.buttonPressed(index: 2, buttons: buttons)
            gameLogic.resetGame(buttons: buttons)
            break
        case buttons[3]:
            gameLogic.buttonPressed(index: 3, buttons: buttons)
            gameLogic.resetGame(buttons: buttons)
            break
        case buttons[4]:
            gameLogic.buttonPressed(index: 4, buttons: buttons)
            gameLogic.resetGame(buttons: buttons)
            break
        case buttons[5]:
            gameLogic.buttonPressed(index: 5, buttons: buttons)
            gameLogic.resetGame(buttons: buttons)
            break
        case buttons[6]:
            gameLogic.buttonPressed(index: 6, buttons: buttons)
            gameLogic.resetGame(buttons: buttons)
            break
        case buttons[7]:
            gameLogic.buttonPressed(index: 7, buttons: buttons)
            gameLogic.resetGame(buttons: buttons)
            break
        case buttons[8]:
            gameLogic.buttonPressed(index: 8, buttons: buttons)
            gameLogic.resetGame(buttons: buttons)
            break
        default:
            return
        }
    }
}
