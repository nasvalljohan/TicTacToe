
import Foundation

struct Player {

    var playerName: String
    var score: Int
    var vsComputer: Bool
    
    init(playerName: String, score: Int, vsComputer: Bool) {
        self.playerName = playerName
        self.score = score
        self.vsComputer = vsComputer
    }
}
