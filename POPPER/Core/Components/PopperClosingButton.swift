//
//  PopperCancelButton.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI

struct PopperClosingButton: View {
    let buttonText: String
    let onClick: () -> Void
    
    init(buttonText: String, onClick: @escaping () -> Void) {
        self.buttonText = buttonText
        self.onClick = onClick
    }
    
    var body: some View {
        Button(buttonText, action: onClick)
        .foregroundColor(.black)
        .frame(width: 100, height: 50)
        .background(Color.red.opacity(0.25))
        .cornerRadius(20)
        .bold()
    }
}

#Preview {
    PopperButton(buttonText: "Cancel", onClick: {})
}
