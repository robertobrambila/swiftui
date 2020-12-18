//
//  LitDivider.swift
//  SwiftUI Components (iOS)
//
//  Created by Roberto Brambila on 12/18/20.
//

//  A customizeable, two-tone divider

import SwiftUI

struct LitDivider: View {
    
    // define our variables with defaults
    var hilite: Color = Color.white
    var shadow: Color = Color.black
    var width: CGFloat = 1.0
    var length: CGFloat = 100
    var direction: Axis.Set = .horizontal
    
    var body: some View {
        // handle our angle
        if direction == .horizontal {
            VStack(spacing: 0) {
            Rectangle()
                .fill(hilite)
                .frame(width: length, height: width)
            Rectangle()
                .fill(shadow)
                .frame(width: length, height: width)
            }
        } else {
            HStack(spacing: 0) {
            Rectangle()
                .fill(shadow)
                .frame(width: width, height: length)
            
            Rectangle()
                .fill(hilite)
                .frame(width: width, height: length)
            }
        }
    }
}

struct LitDivider_Previews: PreviewProvider {
    static var previews: some View {
        LitDivider(
            hilite: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),
            shadow: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)),
            width: 2.0,
            length: 270,
            direction: .vertical)
    }
}
