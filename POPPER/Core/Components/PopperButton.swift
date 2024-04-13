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
    
    init(buttonText: String, onClick: @escaping () -> Void) {
        self.buttonText = buttonText
        self.onClick = onClick
    }
    
    var body: some View {
        Button(buttonText, action: onClick)
        .foregroundColor(.black)
        .frame(width: 350, height: 50)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(20)
        .bold()
    }
}

#Preview {
    PopperButton(buttonText: "Login", onClick: {})
}

