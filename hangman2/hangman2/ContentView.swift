//
//  ContentView.swift
//  hangman2
//
//  Created by Kenni Kollemorten on 17/08/2021.
//
import Foundation
import SwiftUI

enum letters:String {
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
    case e = "e"
    case f = "f"
    case g = "g"
    case h = "h"
    case i = "i"
    case j = "j"
    case k = "k"
    case l = "l"
    case m = "m"
    case n = "n"
    case o = "o"
    case p = "p"
    case q = "q"
    case r = "r"
    case s = "s"
    case t = "t"
    case u = "u"
    case v = "v"
    case w = "w"
    case x = "x"
    case y = "y"
    case z = "z"
    case æ = "æ"
    case ø = "ø"
    case å = "å"
    case sp = "_"
    
}


struct ContentView: View {
    
    
    
    @State var thereIsAWord = false
    @State var runningLetter = "nil"
    @State var pressedButton : letters?
    @State var numberContainer = 0
    @State var numberOfCarators = 0
    @State var theWord = "empty"
    @State var finnish = false
    var words = ["dog", "mouse",  "cat", "pig", "cow", "sheep", "elephant"]
   
    struct WordLetter : Identifiable {
        // has to be identifiable because some words (e.g. HELLO) have non-unique letters: so can't use .self as id
        var id: Int = 0
        var letter: letters = .sp
    }
    let buttons: [[letters]] = [
        [.a, .b, .c, .d, .e, .f, .g],
        [.h, .i, .j, .k, .l, .m, .n],
        [.o, .p, .q, .r, .s, .t, .u],
        [.v, .w, .x, .y, .z, .æ, .ø, .å]
    ]

    
    
    
    
    
    var body: some View {
    

        VStack{
            ForEach(buttons, id: \.self) {row in
                HStack{
                    ForEach(row, id: \.self) {item in
                        Button(action: {
                            if !thereIsAWord {
                                self.numberContainer = Int.random(in: 0...words.count - 1)
                                let myWord = words[self.numberContainer]
                                self.theWord = myWord
                                let numberOfLetters = myWord.count
                                self.numberOfCarators = numberOfLetters
                                self.thereIsAWord = true
                            }
                            else {}
                            
                            
                            self.pressedButton = item
                            if let number = pressedButton{
                                (self.runningLetter) = number.rawValue
                            }
                        }, label: {
                            Text(item.rawValue)
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                                .frame(width: 20, height: 20)
                                .padding(.all, 6)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                            
                            
                            
                        })
                        
                    }
                }
            }
           
            Spacer()
            HStack{
                Text(runningLetter)
                Image(systemName: "signature")
                    .font(.system(size: 122))
                    
                Text(theWord)
                Text(String(numberOfCarators))
            }
            Spacer()
        }
    }
    
    
   

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
