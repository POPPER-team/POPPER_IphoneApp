//
//  IngredientsField.swift
//  POPPER
//
//  Created by Lorena Kovačić on 16.06.2024..
//

import SwiftUI

struct IngredientsField: View {
    @State private var recipePart: String = ""
    @State private var selected = false
    @State private var fieldHeight = 50
    
    var body: some View {
        
        VStack(alignment: .leading){
        Text("INGREDIENTS")
            .font(.title2)
            .fontWeight(.semibold)
            .animation(.easeIn, value: fieldHeight)
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray.opacity(0.25))
                .frame(width: 350, height: CGFloat(fieldHeight))
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: fieldHeight)
                TextField (
                    "Start typing ingredients...",
                    text : $recipePart,
                    axis: .vertical
                )
                .padding()
                .frame(width: 350, height : CGFloat(fieldHeight), alignment : .top)
                .cornerRadius(20)
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

#Preview {
    IngredientsField()
}
