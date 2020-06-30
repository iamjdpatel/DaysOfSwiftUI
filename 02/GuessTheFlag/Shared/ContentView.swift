//
//  ContentView.swift
//  Shared
//
//  Created by JD on 29/06/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedAnswer: Int = 0
    
    @State private var scoreTitle = ""
    
    @State private var score: Int = 0
    
    @State private var showingScore = false

    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.gray, lineWidth: 0.5))
                            .shadow(color: .black, radius: 1)
                    }
                }
                
                VStack {
                    Text("Your Score")
                        .foregroundColor(.white)
                    Text("\(score)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                Spacer()
                Text("JD")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.white)
            }
            
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Wrong! That’s the flag of \(countries[selectedAnswer])"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
            
        }

    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 15
            self.askQuestion()
        } else {
            scoreTitle = "OOPS!"
            score -= 5
            selectedAnswer = number
            showingScore = true
        }
        
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
