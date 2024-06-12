//
//  PopperCloseButton.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI

struct PopperCloseButton: View {
    let onClick: () -> Void
    
        var body: some View {
            Button ( "X" , action: onClick)
            .foregroundColor(.black)
            .frame(width: 40, height: 40)
            .background(Color.red.opacity(0.25))
            .cornerRadius(20)
            .bold()
        }
    }


#Preview {
    PopperCloseButton(onClick: {})
}
