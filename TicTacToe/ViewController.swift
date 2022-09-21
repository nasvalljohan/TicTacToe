import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreNamep1: UILabel!
    @IBOutlet weak var scoreNamep2: UILabel!
    @IBOutlet weak var scoreP1: UILabel!
    @IBOutlet weak var scoreP2: UILabel!
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var lblWinner: UILabel!
    @IBOutlet weak var lblTurn: UILabel!
    
    var p1NameReceived: String?
    var p2NameReceived: String?
    var boolReceived: Bool = false
    var gameLogic = GameLogic(player1: Player(playerName: "Player 1", score: 0, vsComputer: false),
                              player2: Player(playerName: "Player 2", score: 0, vsComputer: false))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnPlayAgain.isHidden = true
        lblWinner.isHidden = true
        gameLogic.player1.playerName = p1NameReceived ?? "player 1"
        gameLogic.player2.playerName = p2NameReceived ?? "player 2"
        gameLogic.player2.vsComputer = boolReceived
        scoreNamep1.text = gameLogic.player1.playerName
        scoreNamep2.text = gameLogic.player2.playerName
        scoreP1.text = String(gameLogic.player1.score)
        scoreP2.text = String(gameLogic.player2.score)
        
        lblTurn.text = "\(gameLogic.player1.playerName) turn to play"

    }
    
    //MARK: UI SWITCH
    func uiToggles(tag: Int, result: Int){
        switch result{
        case gameLogic.GAME_STATUS_PLAYER1TURN:
            if buttons[tag].titleLabel?.text == " " {
                buttons[tag].setTitle("X", for: .normal)
                buttons[tag].titleLabel?.font = .systemFont(ofSize: 80)
                lblTurn.text = "\(gameLogic.player1.playerName) turn to play"}
            
        case gameLogic.GAME_STATUS_PLAYER2TURN:
            if buttons[tag].titleLabel?.text == " "{
                buttons[tag].setTitle("O", for: .normal)
                buttons[tag].titleLabel?.font =  .systemFont(ofSize: 80)
                lblTurn.text = "\(gameLogic.player2.playerName) turn to play"
                if gameLogic.player2.vsComputer && gameLogic.playerTurn == false{
                    buttons[tag].sendActions(for: .touchUpInside)
                }
            }
            
        case gameLogic.GAME_STATUS_PLAYER1WON:
            if buttons[tag].titleLabel?.text == " " {
                buttons[tag].setTitle("O", for: .normal)
                buttons[tag].titleLabel?.font = .systemFont(ofSize: 80)}
            lblWinner.text = "\(gameLogic.player1.playerName) is the winner"
            scoreP1.text = String(gameLogic.player1.score)
            disableButtons()
            
        case gameLogic.GAME_STATUS_PLAYER2WON:
            if buttons[tag].titleLabel?.text == " "{
                buttons[tag].setTitle("X", for: .normal)
                buttons[tag].titleLabel?.font =  .systemFont(ofSize: 80)}
            lblWinner.text = "\(gameLogic.player2.playerName) is the winner"
            scoreP2.text = String(gameLogic.player2.score)
            disableButtons()
            
        case gameLogic.GAME_STATUS_GAMEDRAW:
            lblWinner.text = "Game is a draw"
            if buttons[tag].titleLabel?.text == " "{
                buttons[tag].setTitle("☠️", for: .normal)
                buttons[tag].titleLabel?.font =  .systemFont(ofSize: 70)}
            disableButtons()
            
        default: return
        }
    }
    
    //MARK: IBActions
    @IBAction func playAgainPress(_ sender: Any) {
        resetBoard()
        gameLogic.resetAfterWin()
    }
    
    @IBAction func onPress(_ sender: UIButton) {
        
        let tag = gameLogic.switchTurn(tag: sender.tag)
        let result = gameLogic.buttonPressed()
        uiToggles(tag: tag, result: result)
        buttons[(tag)].isUserInteractionEnabled = false
        
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
        
        if gameLogic.playerTurn {
            lblTurn.text = "\(gameLogic.player1.playerName) turn to play"
        } else{
            lblTurn.text = "\(gameLogic.player2.playerName) turn to play"
        }
        
        for button in buttons{
            button.setTitle(" ", for: .normal)
            button.isUserInteractionEnabled = true
        }
    }
}
