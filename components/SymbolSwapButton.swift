//
//  SymbolSwapButton.swift
//  SwiftUI Components (iOS)
//
//  Created by Roberto Brambila on 12/17/20.
//

//  A customizeable button that swaps between two system symbols

import SwiftUI

struct SymbolSwapButton: View {
    var function : () -> Void
    
    // define our variables with defaults
    var symbol1 : String = "pencil.circle.fill"
    var color1 : Color = .black
    
    var symbol2 : String = "checkmark.circle.fill"
    var color2 : Color = .red
    
    var size : CGFloat = 24
    var weight : Font.Weight = .regular
    
    // allows you to revert to the initial state after a specified delay
    var swapDelay : Double = 0
    
    @State var swap : Bool = false
    
    var body: some View {
        Button(action: {
            self.function() // run any action we passed on
            self.swap.toggle() // toggle our swap state boolean
            
            // only revert if the delay is greater 0
            if (swapDelay > 0) {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.swapDelay) {
                    self.swap.toggle()
                }
            }
            
        }) {
            Image(systemName: String(swap ? symbol2 : symbol1))
                .font(.system(size: size, weight: weight))
                .foregroundColor(swap ? color2 : color1)
                
        }
            .buttonStyle(DefaultButtonStyle()) // pass on your own style here
    }
}

struct SymbolSwapButton_Previews: PreviewProvider {
    static var previews: some View {
        SymbolSwapButton(function: {
            // Button action code goes here
            print("Hello, world.")
        },
        symbol1: "person.circle.fill",
        symbol2: "trash.circle.fill",
        size: 48,
        weight: .black,
        swapDelay: 1.0
        )
    }
}
