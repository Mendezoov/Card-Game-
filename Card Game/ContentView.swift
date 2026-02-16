//
//  ContentView.swift
//  Card Game
//
//  Created by Mendez on 1/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = CardGameViewModel()
    
    var body: some View {
        ZStack {
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                
                // Cards Display
                HStack {
                    Spacer()
                    Image(viewModel.playerCard.imageName)
                    Spacer()
                    Image(viewModel.cpuCard.imageName)
                    Spacer()
                }
                Spacer()
                
                // Deal Button
                Button {
                    viewModel.deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                
                // Score Display
                HStack {
                    Spacer()
                    PlayerScoreView(
                        playerName: viewModel.player.name,
                        score: viewModel.player.score,
                        gradientColors: [.blue, .blue.opacity(0.7)]
                    )
                    Spacer()
                    PlayerScoreView(
                        playerName: viewModel.cpu.name,
                        score: viewModel.cpu.score,
                        gradientColors: [.purple, .purple.opacity(0.7)]
                    )
                    Spacer()
                }
                .foregroundStyle(Color.white)
                Spacer()
                
                // Result Message
                Text(viewModel.gameResult.message)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(
                                LinearGradient(
                                    colors: [.green.opacity(0.8), .teal.opacity(0.8)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .shadow(color: .green.opacity(0.5), radius: 15, x: 0, y: 5)
                    )
                    .opacity(viewModel.gameResult.message.isEmpty ? 0 : 1)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: viewModel.gameResult.message)
                
                Spacer()
                
                // Clear Results Button
                Button {
                    viewModel.clearResults()
                } label: {
                    Text("Clear results")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 15)
                        .background(
                            LinearGradient(
                                colors: [.red, .red.opacity(0.8)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(20)
                        .shadow(color: .red.opacity(0.4), radius: 10, x: 0, y: 5)
                }
            }
        }
    }
}

// MARK: - Subviews

struct PlayerScoreView: View {
    let playerName: String
    let score: Int
    let gradientColors: [Color]
    
    var body: some View {
        VStack {
            Text(playerName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(15)
                .shadow(color: gradientColors[0].opacity(0.3), radius: 5, x: 0, y: 3)
            
            VStack(spacing: 5) {
                Text("SCORE")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white.opacity(0.7))
                    .tracking(2)
                
                Text(String(score))
                    .font(.system(size: 70, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.yellow, .orange],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: .yellow.opacity(0.5), radius: 8, x: 0, y: 3)
            }
            .padding(.top, 10)
        }
    }
}

#Preview {
    ContentView()
}

