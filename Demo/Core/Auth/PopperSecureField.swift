//
//  PopperSecureField.swift
//  Demo
//
//  Created by Matija Lukanić on 04.04.2024..
//

import SwiftUI

struct PopperSecureField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .frame(width: 350, height: 50)
            .background(Color.gray.opacity(0.25))
            .cornerRadius(20)
            .bold()
    }
}

