//
//  GradientFillToggle.swift
//  SwiftUI Components (iOS)
//
//  Created by Roberto Brambila on 12/18/20.
//

import SwiftUI

struct GradientFillToggle: View {
    @State var enableToggle: Bool = false
    
    // define our label variables with defaults
    var label : String = "Label"
    var labelColor : Color = .black
    
    var size : CGFloat = 16
    var weight : Font.Weight = .regular
    var design : Font.Design = .default
    
    
    // define our optional togglestyle variables
    var thumbColor : Color?
    var inactiveGradient : Gradient?
    var activeGradient : Gradient?
    var startPoint : UnitPoint?
    var endPoint : UnitPoint?
    
    var body: some View {
        Toggle(isOn: $enableToggle ){
            Text("\(label)")
                .foregroundColor(labelColor)
                .font(.system(size: size, weight: weight, design: design))
        }
        .toggleStyle(LinearGradientFillToggleStyle(thumbColor: thumbColor, inactiveGradient: inactiveGradient, activeGradient: activeGradient, startPoint: startPoint, endPoint: startPoint)) // defined in Styles/LinearGradientFillToggleStyle.swift
        .padding()
    }
}

struct GradientFillToggle_Previews: PreviewProvider {
    static var previews: some View {
        GradientFillToggle(
            label: "Use Dark Mode",
            activeGradient: Gradient(colors: [Color(#colorLiteral(red: 0.1137254902, green: 0.5215686275, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.3647058824, green: 0.1058823529, blue: 0.6901960784, alpha: 1))])
        )
    }
}
