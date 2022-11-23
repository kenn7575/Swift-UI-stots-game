//
//  ContentView.swift
//  Slots-Challenge
//
//  Hello! It's Chris here. Thanks for trying the challenge!
//  Just a quick note before you review this solution.
//  Remember, there are MULTIPLE ways to do anything so if your solution worked,
//  count it as a win!
//  With a little demo like this, don't stress about what is the "best" way.

import SwiftUI

struct ContentView: View {
    
    @State var credits = 1000
    @State var slot1 = 1
    @State var slot2 = 1
    @State var slot3 = 1
    
    var body: some View {
        
        VStack(spacing: 20.0) {
            Spacer()
            Text("SwiftUI Slots").font(.largeTitle)
            Spacer()
            
            // This is the first time I'm showing you this:
            // Substitute variables/properties into a string with \(var)
            Text("Credits \(credits)")
            
            HStack {
                // The images were too wide to begin with so make sure you
                // add the resizable and aspectRatio modifiers
                Image("fruit\(slot1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("fruit\(slot2)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("fruit\(slot3)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            Button("Spin") {
                
                // Randomize the numbers
                slot1 = Int.random(in: 1...3)
                slot2 = Int.random(in: 1...3)
                slot3 = Int.random(in: 1...3)
                
                // Update credits based on match or not
                if slot1 == slot2 && slot2 == slot3 {
                    // Match
                    credits += 15
                }
                else {
                    credits -= 5
                }
            }
            // Set padding for all edges
            .padding()
            // Then adjust the left and right padding to be bigger
            .padding([.leading, .trailing], 40)
            .foregroundColor(.white)
            .background(Color(.systemPink))
            .cornerRadius(25)
            .font(.system(size: 18, weight: .bold, design: .default))
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
