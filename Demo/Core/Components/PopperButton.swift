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
    @Binding var isPresented: Bool
    
    init(buttonText: String, onClick: @escaping () -> Void, isPresented: Binding<Bool>) {
        self.buttonText = buttonText
        self.onClick = onClick
        self._isPresented = isPresented
    }
    
    var body: some View {
        Button(buttonText)
        {
            onClick()
        }
        .foregroundColor(.black)
        .frame(width: 350, height: 50)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(20)
        .bold()
    }
}

