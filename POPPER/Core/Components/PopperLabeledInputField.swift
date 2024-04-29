//
//  PopperLabeledInputField.swift
//  POPPER
//
//  Created by Matija Lukanić on 18.04.2024..
//

import SwiftUI

struct PopperLabeledTextField: View {
    let labelText: String
    let placeholder: String
    @State private var inputText = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(labelText)
                    .bold()
                Spacer()
            }
            .padding(.horizontal)
            TextField(placeholder, text: $inputText)
                .padding(.horizontal)
        }
    }
}


