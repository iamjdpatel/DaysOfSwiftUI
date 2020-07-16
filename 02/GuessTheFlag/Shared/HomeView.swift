//
//  HomeView.swift
//  Shared
//
//  Created by JD on 29/06/20.
//

import SwiftUI

struct HomeView: View {
    
    @State private var countries = ["India", "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedAnswer: Int = 0
    @State private var scoreTitle = ""
    @State private var score: CGFloat = 0
    @State private var showingScore = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                Color.clear.overlay(
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 120, height: 120)
                        .modifier(ScoreIndicator(scr: self.score))
                ).onTapGesture {
                    self.score = 0
                }
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
                Spacer()
                Text("JD")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
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
            withAnimation(.easeInOut(duration: 0.5)) { self.score += 0.2 }
            self.askQuestion()
        } else {
            scoreTitle = "-5"
            withAnimation(.easeInOut(duration: 0.125)) { self.score -= 0.05 }
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
        HomeView()
    }
}
