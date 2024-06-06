//
//  PopperIngredientsField.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI

struct StepsFieldFocused: View {
    @State private var recipePart: String = ""
    @State private var tapped = false
    //@State private var focused = false
    
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in self.tapped = !self.tapped }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("STEPS")
                .font(.title2)
                .fontWeight(.semibold)
            
            TextField (
                "Start typing step...",
                text : $recipePart
            )
            .padding()
            .frame(width: 350, height: self.tapped ? 300 : 50)
            .background(Color.gray.opacity(0.25))
            .cornerRadius(20)
            .font(.system(size: 16, weight: .bold))
            
        }
    }
}

#Preview {
    StepsFieldFocused()
}
