//
//  EditProfileView.swift
//  POPPER
//
//  Created by Matija Lukanić on 14.04.2024..
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selectDate = Date()
    var userDob = Date()
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding()
                }
                Spacer()
                
                Text("Edit Profile")
                    .bold()
                
                Spacer()
                
                Image(systemName: "checkmark")
                    .foregroundColor(.black)
                    .padding()
            }
            Spacer()
        }.background(Color.gray.opacity(0.2))
    }
}





#Preview {
    EditProfileView()
}
