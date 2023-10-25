

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy",
                                    "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var showingRestart = false
    @State private var scoreTitle = ""
    
    @State private var questionsCount = 0
    
    @State private var score = 0
    
    var body: some View {
        
        ZStack{
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            
            VStack{
                
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack (spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            
                    }
                    
                    ForEach(0..<3) { number in
                        Button(action: {
                            
                            if questionsCount < 8 {
                                flagTapped(number)
                            } else {
                                showingRestart = true
                            }
                            
                        }) {
                            Image(countries[number])
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Tries: \(questionsCount)/8")
                    .foregroundStyle(.white)
                    .font(.subheadline.weight(.semibold))
                
                Spacer()
            }
            .padding()
        }
            
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                askQuestion()
            }
        } message: {
            Text("Score: \(score)")
        }
        
        .alert("Click continue to restart the game", isPresented: $showingRestart) {
            Button("Continue") {
                questionsCount = 0
                score = 0
                askQuestion()
            }
        }
    }
    
     func flagTapped(_ number: Int) {
        if correctAnswer == number {
            scoreTitle = "Correct"
            score += 1
            questionsCount += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[correctAnswer])"
            questionsCount += 1
        }
        showingScore = true
    }
    
    func askQuestion(){
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
