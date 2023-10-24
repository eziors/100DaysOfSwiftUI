

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy",
                                    "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack (spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) {number in
                    Button() {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                askQuestion()
            }
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        if correctAnswer == number {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
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
