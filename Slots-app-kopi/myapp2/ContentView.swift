//
//  ContentView.swift
//  slots 2,0
//
//  Created by Kenni Kollemorten on 20/07/2021.
//

import SwiftUI


struct ContentView: View {
    
    
    
    @State private var plus = false
    @State private var symbols = ["star", "apple",  "cherry"] 
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var CreditsSignature = 0
    @State private var credits = 1000
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var colorGreen = Color(red: 59/255, green: 255/255, blue: 69/255)
    private var betAmount = 5
    
    var body: some View {


        ZStack{
            
            Rectangle()
                .foregroundColor(.init(red: 255/255, green: 100/255, blue: 70/255))
                .ignoresSafeArea(.all)
               
            Rectangle()
                .foregroundColor(.init(red: 33/225, green: 221/255, blue: 255/255))
                .rotationEffect(Angle(degrees: 45))
                .ignoresSafeArea(.all)
                .scaleEffect(1.2)
            
            VStack{
                
                
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.init(red: 255/255, green: 161/255, blue: 82/255))
                    
                    Text("swiftUI slots")
                        
                        .bold()
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.init(red: 255/255, green: 161/255, blue: 82/255))
                }.padding(.top, 30) .scaleEffect(2)
                
                Spacer()
                HStack{
                    Text("credits " + String(credits))
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Text((plus ? "+" : "") + String(CreditsSignature))
                        .foregroundColor(plus ? .black : .white)
                        .bold()
                        .padding()
                        .background(plus ? colorGreen.opacity(0.8) : Color.red.opacity(0.8))
                        .cornerRadius(20)
                        .padding(.leading, 14)
                    
                }
                Spacer()
               
                VStack{
                    HStack{
                        Spacer()
                        //lets you view the slots
                        CardView(symbol: $symbols[numbers[0]],background: $backgrounds[0])
                        
                        CardView(symbol: $symbols[numbers[1]],background: $backgrounds[1])
                        
                        CardView(symbol: $symbols[numbers[2]],background: $backgrounds[2])
                        
                        
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        //lets you view the slots
                        CardView(symbol: $symbols[numbers[3]],background: $backgrounds[3])
                        
                        CardView(symbol: $symbols[numbers[4]],background: $backgrounds[4])
                        
                        CardView(symbol: $symbols[numbers[5]],background: $backgrounds[5])
                        
                        
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        //lets you view the slots
                        CardView(symbol: $symbols[numbers[6]],background: $backgrounds[6])
                        
                        CardView(symbol: $symbols[numbers[7]],background: $backgrounds[7])
                        
                        CardView(symbol: $symbols[numbers[8]],background: $backgrounds[8])
                        
                        
                        Spacer()
                    }
                }
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        //spin button action
                        Button(action: {
                            
                            self.processResult()
                            
                            //spin button label
                        }, label: {
                            Text("spin")
                                .font(.title3)
                                .foregroundColor(.black)
                                .bold()
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(Color.init(red: 255/255, green: 100/255, blue: 163/255))
                                .cornerRadius(20)
                            
                            
                        }).shadow(radius: 5)
                        .padding(.trailing, 6)
                        
                        Text("-5 credits")
                            .bold()
                            .padding(.top, 5)
                        
                    }
                    VStack{
                        
                        Button(action: {
                            
                            
                            self.processResult(true)
                            
                        }, label: {
                            Text("Max Spin!")
                                .font(.title3)
                                
                                .foregroundColor(.black)
                                .bold()
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(colorGreen)
                                .cornerRadius(20)
                            
                            
                        }).shadow(radius: 5)
                        .padding(.trailing, 6)
                        
                        Text("-50 credits")
                            .bold()
                            .padding(.top, 5)
                    }
                    Spacer()
                    
                }
                
                Spacer()
            }
            
        }.animation(.easeOut(duration: 0.2))
    }
    
    
    
    
    
    func processResult(_ isMax:Bool = false) {
        
        self.CreditsSignature = 0
        self.plus = false
        
        //set background color to white
        self.backgrounds = self.backgrounds.map({ _ in Color.white})
        
        
        //create random number in slots
        
        if isMax {
            self.numbers = self.numbers.map({ _ in
                Int.random(in: 0...self.symbols.count - 1)
            })
        } else {
            self.numbers[3] = Int.random(in: 0...2)
            self.numbers[4] = Int.random(in: 0...2)
            self.numbers[5] = Int.random(in: 0...2)
        }
        //check winnings
        processWin(isMax)
        
    }
    
    
    
    
    
    func processWin(_ isMax:Bool = false) {
        
        var matches = 0
        
        
        if !isMax {
            
            //process single spin
            if isMatch(3, 4, 5) { matches += 1 }
            
        }
        else {
            //process max spin
            
            //process top row
            if isMatch(0, 1, 2) { matches += 1}
            //process middle row
            if isMatch(3, 4, 5) { matches += 1}
            //process bottom row
            if isMatch(6, 7, 8) { matches += 1}
            //process top left to bottom right row
            if isMatch(0, 4, 8) { matches += 1}
            //process top right to bottom left row
            if isMatch(2, 4, 6) { matches += 1}
            if isMatch(0, 3, 6) { matches += 1}
            if isMatch(1, 4, 7) { matches += 1}
            if isMatch(2, 5, 8) { matches += 1}



            
        }
        if matches > 0 {
            //at least 1 win
            self.credits += matches * 25
            self.CreditsSignature += matches * 25
            self.plus = true
        }
        
        else if !isMax {
            //0 wins single spin
            self.credits -= 5
            self.CreditsSignature -= 5
        }
        else {
            //0 wins max spin
            self.credits -= 50
            self.CreditsSignature -= 50
        }
        if matches >= 4 {movementJackpot()
            let secondsToDelay = 0.4
            DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
              movementJackpot() } }
        else if matches == 2 || matches == 3 {movementJackpot()}
        else if matches == 0 {movementLose()}
        else {movementWin()
            
        }
    }
    
    func isMatch(_ index1:Int, _ index2:Int, _ index3:Int) -> Bool {
        
        if self.numbers[index1] == self.numbers[index2] && self.numbers[index2] == self.numbers[index3] {
            
            self.backgrounds[index1] = colorGreen
            self.backgrounds[index2] = colorGreen
            self.backgrounds[index3] = colorGreen
            
            
            return true
            
        }
        return false
    }
        
}


func movementWin() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success) }



func movementJackpot() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.error)
    
}
   
    func movementLose() {
    let genarator =  UIImpactFeedbackGenerator()
        genarator.impactOccurred()
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
