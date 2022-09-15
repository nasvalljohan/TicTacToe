
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var lblWinner: UILabel!
    @IBOutlet weak var lblTurn: UILabel!
    
    var gameLogic = GameLogic(player1: Player(playerName: "Player 1", score: 0), player2: Player(playerName: "Player 2", score: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPlayAgain.isHidden = true
        lblWinner.isHidden = true
        lblTurn.text = "\(gameLogic.player1.playerName) turn to play"
    }

    //MARK: On press
    @IBAction func playAgainPress(_ sender: Any) {
        resetBoard()
        gameLogic.resetAfterWin()
    }
    @IBAction func onPress(_ sender: UIButton) {
        let result = gameLogic.buttonPressed(tag: sender.tag)
        print(sender.tag)
        uiToggles(tag: sender.tag, result: result)
    }
    
    func uiToggles(tag: Int, result: Int){
        switch result{
        case gameLogic.GAME_STATUS_PLAYER1WON:
            print("Player 1 win!")
            if buttons[tag].titleLabel?.text == " " {
                buttons[tag].setTitle("O", for: .normal)
                buttons[tag].titleLabel?.font = .systemFont(ofSize: 80)}
            lblWinner.text = "\(gameLogic.player1.playerName) is the winner"
            disableButtons()
            
        case gameLogic.GAME_STATUS_PLAYER2WON:
            print("Player 2 win!")
            if buttons[tag].titleLabel?.text == " "{
                buttons[tag].setTitle("X", for: .normal)
                buttons[tag].titleLabel?.font =  .systemFont(ofSize: 80)}
            lblWinner.text = "\(gameLogic.player2.playerName) is the winner"
            disableButtons()
            
        case gameLogic.GAME_STATUS_GAMEDRAW:
            lblWinner.text = "Game is a draw"
            disableButtons()

        case gameLogic.GAME_STATUS_PLAYER1TURN:
            print("player 1 turn to play")
            if buttons[tag].titleLabel?.text == " " {
                buttons[tag].setTitle("X", for: .normal)
                buttons[tag].titleLabel?.font = .systemFont(ofSize: 80)
                lblTurn.text = "\(gameLogic.player1.playerName) turn to play"}
            
        case gameLogic.GAME_STATUS_PLAYER2TURN:
            print("player 2 turn to play")
                if buttons[tag].titleLabel?.text == " "{
                    buttons[tag].setTitle("O", for: .normal)
                    buttons[tag].titleLabel?.font =  .systemFont(ofSize: 80)
                    lblTurn.text = "\(gameLogic.player2.playerName) turn to play"}
        default: return
        }
    }
    
    func disableButtons(){
        lblWinner.isHidden = false
        btnPlayAgain.isHidden = false
        lblTurn.isHidden = true
        for button in buttons{
            button.isUserInteractionEnabled = false
        }
    }
    
    func resetBoard(){
        btnPlayAgain.isHidden = true
        lblWinner.isHidden = true
        lblTurn.isHidden = false
        
        for button in buttons{
            button.setTitle(" ", for: .normal)
            button.isUserInteractionEnabled = true
        }
    }
}
