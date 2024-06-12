//
//  StepsFieldFocused.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI

struct StepsFieldFocused: View {
    @State private var recipePart: String = ""
    @State private var tapped = false
    let stepPageCounter : Int = 4
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
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.25))
                    .frame(width: 350, height: 300)
                    TextField (
                        "Start typing step...",
                        text : $recipePart,
                        axis: .vertical
                    )
                    .padding()
                    .frame(width: 325, height : 250, alignment : .top)
                    .cornerRadius(15)
                    .font(.system(size: 16, weight: .bold))
               
                
                    
                    
                
                }
            }
        }
    }

#Preview {
    StepsFieldFocused()
}
