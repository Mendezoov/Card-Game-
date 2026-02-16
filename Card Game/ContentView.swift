//
//  ContentView.swift
//  Card Game
//
//  Created by Mendez on 1/3/26.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "card7"
    @State var cpuCard = "card2"
    
    @State var playerScore = 0
    @State var cpuscore = 0
    @State var result = ""
    
    
    
    
    var body: some View {
        ZStack{
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                    
                    
                    
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                
                
                Spacer()
                HStack{
                    Spacer()
                    VStack {
                        Text("Mendez")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                LinearGradient(
                                    colors: [.blue, .blue.opacity(0.7)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(15)
                            .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 3)
                        
                        VStack(spacing: 5) {
                            Text("SCORE")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white.opacity(0.7))
                                .tracking(2)
                            
                            Text(String(playerScore))
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
                    Spacer()
                    VStack {
                        Text("Computer")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                LinearGradient(
                                    colors: [.purple, .purple.opacity(0.7)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(15)
                            .shadow(color: .purple.opacity(0.3), radius: 5, x: 0, y: 3)
                        
                        VStack(spacing: 5) {
                            Text("SCORE")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white.opacity(0.7))
                                .tracking(2)
                            
                            Text(String(cpuscore))
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
                    
                    Spacer()
                    
                    
                    
                }
                .foregroundStyle(Color.white)
                Spacer()
                
                
                Text(result)
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
                    .opacity(result.isEmpty ? 0 : 1)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: result)
                
                Spacer()
                Button {
                    result = "Start again!"
                    
                }
                label: {
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
    
    func deal(){
        
        //randomize player card
        var playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //randomize cpu card
        var cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        // update the score based on who wins this hand
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if cpuCardValue > playerCardValue {
            cpuscore += 1
        } else {
            // tie: do nothing
        }

        // check for game over at 10 points
        if playerScore >= 10 {
            result = "🎉 Victory! Mendez Wins! 🎉"
            playerScore = 0
            cpuscore = 0
        } else if cpuscore >= 10 {
            result = "💻 Computer Wins! Try Again"
            cpuscore = 0
            playerScore = 0
        }
    }
}


#Preview {
    ContentView()
}

