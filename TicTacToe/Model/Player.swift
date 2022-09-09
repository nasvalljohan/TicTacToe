//
//  Player.swift
//  TicTacToe
//
//  Created by Johan Näsvall on 2022-09-09.
//

import Foundation

struct player {

    var playerName: String
    var score: Int
    
    
    init(playerName: String, score: Int) {
        self.playerName = playerName
        self.score = score
    }
}
