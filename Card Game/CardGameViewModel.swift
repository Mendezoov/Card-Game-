//
//  CardGameViewModel.swift
//  Card Game
//
//  Created by Mendez on 1/3/26.
//

import Foundation

@Observable
class CardGameViewModel {
    // MARK: - Published Properties
    
    var player: Player
    var cpu: Player
    var playerCard: Card
    var cpuCard: Card
    var gameResult: GameResult
    
    // MARK: - Constants
    
    private let winningScore = 10
    
    // MARK: - Initialization
    
    init(playerName: String = "Mendez") {
        self.player = Player(name: playerName)
        self.cpu = Player(name: "Computer")
        self.playerCard = Card(value: 7)
        self.cpuCard = Card(value: 2)
        self.gameResult = .none
    }
    
    // MARK: - Game Logic
    
    func deal() {
        // Generate random cards
        playerCard = .random()
        cpuCard = .random()
        
        // Update scores based on card values
        if playerCard.value > cpuCard.value {
            player.score += 1
        } else if cpuCard.value > playerCard.value {
            cpu.score += 1
        }
        // If equal, it's a tie - no score change
        
        // Check for game over
        checkForWinner()
    }
    
    func clearResults() {
        gameResult = .restart
    }
    
    func resetGame() {
        player.score = 0
        cpu.score = 0
        playerCard = Card(value: 7)
        cpuCard = Card(value: 2)
        gameResult = .none
    }
    
    // MARK: - Private Methods
    
    private func checkForWinner() {
        if player.score >= winningScore {
            gameResult = .playerWin(playerName: player.name)
            resetScores()
        } else if cpu.score >= winningScore {
            gameResult = .cpuWin
            resetScores()
        }
    }
    
    private func resetScores() {
        player.score = 0
        cpu.score = 0
    }
}
