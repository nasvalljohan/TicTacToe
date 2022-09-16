import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var lblWinner: UILabel!
    @IBOutlet weak var lblTurn: UILabel!
    
    var p1NameReceived: String?
    var p2NameReceived: String?
    var gameLogic = GameLogic(player1: Player(playerName: "Player 1", score: 0), player2: Player(playerName: "Player 2", score: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPlayAgain.isHidden = true
        lblWinner.isHidden = true
        gameLogic.player1.playerName = p1NameReceived ?? "player 1"
        gameLogic.player2.playerName = p2NameReceived ?? "player 2"
        
        lblTurn.text = "\(gameLogic.player1.playerName) turn to play"
        
    }
    
    //MARK: UI SWITCH
    func uiToggles(tag: Int, result: Int){
        switch result{
        case gameLogic.GAME_STATUS_PLAYER1WON:
            if buttons[tag].titleLabel?.text == " " {
                buttons[tag].setTitle("💩", for: .normal)
                buttons[tag].titleLabel?.font = .systemFont(ofSize: 80)}
            lblWinner.text = "\(gameLogic.player1.playerName) is the winner"
            disableButtons()
            
        case gameLogic.GAME_STATUS_PLAYER2WON:
            if buttons[tag].titleLabel?.text == " "{
                buttons[tag].setTitle("🍌", for: .normal)
                buttons[tag].titleLabel?.font =  .systemFont(ofSize: 80)}
            lblWinner.text = "\(gameLogic.player2.playerName) is the winner"
            disableButtons()
            
        case gameLogic.GAME_STATUS_GAMEDRAW:
            lblWinner.text = "Game is a draw"
            if buttons[tag].titleLabel?.text == " "{
                buttons[tag].setTitle("☠️", for: .normal)
                buttons[tag].titleLabel?.font =  .systemFont(ofSize: 80)}
            disableButtons()
            
        case gameLogic.GAME_STATUS_PLAYER1TURN:
            if buttons[tag].titleLabel?.text == " " {
                buttons[tag].setTitle("🍌", for: .normal)
                buttons[tag].titleLabel?.font = .systemFont(ofSize: 80)
                lblTurn.text = "\(gameLogic.player1.playerName) turn to play"}
            
        case gameLogic.GAME_STATUS_PLAYER2TURN:
            if buttons[tag].titleLabel?.text == " "{
                buttons[tag].setTitle("💩", for: .normal)
                buttons[tag].titleLabel?.font =  .systemFont(ofSize: 80)
                lblTurn.text = "\(gameLogic.player2.playerName) turn to play"}
        default: return
        }
    }
    
    //MARK: IBActions
    @IBAction func playAgainPress(_ sender: Any) {
        resetBoard()
        gameLogic.resetAfterWin()
    }
    @IBAction func onPress(_ sender: UIButton) {
        gameLogic.switchTurn(tag: sender.tag)
        let result = gameLogic.buttonPressed()
        uiToggles(tag: sender.tag, result: result)
    }
    
    //MARK: UI Functions
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
