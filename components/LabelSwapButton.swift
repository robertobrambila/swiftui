//
//  LabelSwapButton.swift
//  SwiftUI Components (iOS)
//
//  Created by Roberto Brambila on 12/17/20.
//

//  A customizeable button that swaps between two string labels

import SwiftUI

struct LabelSwapButton: View {
    var function : () -> Void
    
    // define our variables with defaults
    var label1 : String = "Label1"
    var color1 : Color = .black
    
    var label2 : String = "Label2"
    var color2 : Color = .red
    
    var size : CGFloat = 24
    var weight : Font.Weight = .regular
    var design : Font.Design = .default
    
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
            Text( "\(swap ? label2 : label1)" )
                .font(.system(size: size, weight: weight, design: design))
                .foregroundColor(swap ? color2 : color1)
        }
            .buttonStyle(DefaultButtonStyle()) // pass on your own style here
    }
}

struct LabelSwapButton_Previews: PreviewProvider {
    static var previews: some View {
        LabelSwapButton(function: {
            // Button action code goes here
            print("Hello, World.")
        },
        label1: "Running",
        label2: "Paused",
        size: 48,
        weight: .black,
        design: .rounded,
        swapDelay: 1.0
        )
    }
}
