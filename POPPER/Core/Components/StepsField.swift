//
//  StepsFieldFocused.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI

struct StepsField: View {
    @State private var recipePart: String = ""
    @State private var selected = false
    @State private var fieldHeight = 50
    let stepPageCounter : Int = 4
    //@State private var focused = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("STEPS")
                .font(.title2)
                .fontWeight(.semibold)
                .animation(.easeIn, value: fieldHeight)
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.25))
                    .frame(width: 350, height: CGFloat(fieldHeight))
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: fieldHeight)
                    TextField (
                        "Start typing step...",
                        text : $recipePart,
                        axis: .vertical
                    )
                    .padding()
                    .frame(width: 325, height : CGFloat(fieldHeight), alignment : .top)
                    .cornerRadius(15)
                    .font(.system(size: 16, weight: .bold))
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: fieldHeight)
                    
                }
            .onTapGesture {
                if(fieldHeight == 50){
                    self.fieldHeight = 300;
                }
                else{
                    fieldHeight = 50;
                }
            }
            }
        }
    }

#Preview{
    StepsField()
}
