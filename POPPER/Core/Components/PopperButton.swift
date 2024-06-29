//
//  PopperButton.swift
//  Demo
//
//  Created by Matija Lukanić on 04.04.2024..
//

import SwiftUI

struct PopperButton: View {
    let buttonText: String
    let onClick: () -> Void
    let img:Image?
    
    init(buttonText: String, onClick: @escaping () -> Void,img :Image? = nil) {
        self.buttonText = buttonText
        self.onClick = onClick
        self.img = img
    }
    
    var body: some View {
        Button(action:onClick, label: {
            HStack{
                Text(buttonText)
                img
            }
            .frame(width: 350, height: 50)
        })
        .foregroundColor(.black)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(20)
        .bold()
    }
}

#Preview {
    PopperButton(buttonText: "Login", onClick: {
        print("Clicked")
    }, img : Image(systemName: "square.and.arrow.up"))
}

