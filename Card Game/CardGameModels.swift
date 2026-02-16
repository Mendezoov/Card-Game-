//
//  CardGameModels.swift
//  Card Game
//
//  Created by Mendez on 1/3/26.
//

import Foundation

// MARK: - Models

struct Player {
    let name: String
    var score: Int
    
    init(name: String, score: Int = 0) {
        self.name = name
        self.score = score
    }
}

struct Card {
    let value: Int
    
    var imageName: String {
        "card\(value)"
    }
    
    static func random() -> Card {
        Card(value: Int.random(in: 2...14))
    }
}

enum GameResult {
    case none
    case playerWin(playerName: String)
    case cpuWin
    case restart
    
    var message: String {
        switch self {
        case .none:
            return ""
        case .playerWin(let playerName):
            return "🎉 Victory! \(playerName) Wins! 🎉"
        case .cpuWin:
            return "💻 Computer Wins! Try Again"
        case .restart:
            return "Start again!"
        }
    }
}
