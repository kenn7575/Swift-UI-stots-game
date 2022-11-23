//
//  CardView.swift
//  myapp2
//
//  Created by Kenni Kollemorten on 20/07/2021.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol:String
    @Binding var background:Color

     var transisions: AnyTransition = AnyTransition.move(edge: .bottom)
    
    var body: some View {
        
        
        VStack {
            if symbol == "apple" {
                Image(symbol)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                    .transition(transisions)
            }
            else if symbol == "cherry" {
                Image(symbol)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                    .transition(transisions)

            }
            else {
                Image(symbol)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                    .transition(transisions)

            }
            }.background(background.opacity(0.5))
            .cornerRadius(20)
        
        
    }
        
    }


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("cherry"), background: Binding.constant(Color.green))   }
}
