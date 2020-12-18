//
//  GradientFillToggleStyle.swift
//  SwiftUI Components (iOS)
//
//  Created by Roberto Brambila on 12/18/20.
//

//
// Usage example in Components/LinearGradientFillToggle.swift

import SwiftUI

struct LinearGradientFillToggleStyle: ToggleStyle {
    
    // define our variables with optional defaults
    var thumbColor : Color?
    var inactiveGradient : Gradient?
    var activeGradient : Gradient?
    var startPoint : UnitPoint?
    var endPoint : UnitPoint?
    
    func makeBody(configuration: Configuration) -> some View {
        
        let inactiveLinearGradient : LinearGradient = LinearGradient(
            gradient: self.inactiveGradient ?? Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))]),
            startPoint: self.startPoint ?? .leading,
            endPoint: self.endPoint ?? .trailing)
        
        let activeLinearGradient : LinearGradient = LinearGradient(
            gradient: self.activeGradient ?? Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]),
            startPoint: self.startPoint ?? .leading,
            endPoint: self.endPoint ?? .trailing)
        
        // define our UI
        return HStack {
            configuration.label
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? activeLinearGradient : inactiveLinearGradient)
                .frame(width: 50, height: 29)
                .overlay(Circle()
                    .fill(thumbColor ?? Color.white)
                    .shadow(radius: 1, x: 0, y: 1)
                    .padding(1.5)
                    .offset(x: configuration.isOn ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.2))
                .onTapGesture { configuration.isOn.toggle() }
            
        }
    }
}
