//
//  PopperInputField.swift
//  Demo
//
//  Created by Matija Lukanić on 04.04.2024..
//

import SwiftUI

struct PopperInputField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .frame(width: 350, height: 50)
            .background(Color.gray.opacity(0.25))
            .cornerRadius(20)
            .font(.system(size: 16, weight: .bold))
    }
}

