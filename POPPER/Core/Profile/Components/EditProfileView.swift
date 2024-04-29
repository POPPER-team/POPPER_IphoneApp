//
//  EditProfileView.swift
//  POPPER
//
//  Created by Matija Lukanić on 14.04.2024..
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var bio = ""
    @State private var dob = ""
    @State private var website = ""
    @State private var isPasswordDropdownOpen = false
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var isEditingProfilePicture = false
    
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
                
                Button(action: {
                    //TODO: Handle Save button
                }) {
                    Image(systemName: "checkmark")
                        .foregroundColor(.black)
                        .padding()
                }
            }
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(.systemGray))
            
            PopperButton(buttonText: "Edit picture", onClick: {
                isEditingProfilePicture.toggle()
            })
            
            
            VStack(alignment: .leading, spacing: 20) {
                PopperLabeledTextField(labelText: "Name", placeholder: "Name")
                PopperLabeledTextField(labelText: "BIO", placeholder: "Add bio")
                PopperLabeledTextField(labelText: "DOB", placeholder: "DD/MM/YYYY")
                PopperLabeledTextField(labelText: "WEBSITE", placeholder: "add a link to your website")
                
                Button(action: {
                    isPasswordDropdownOpen.toggle()
                }) {
                    Text("CHANGE PASSWORD")
                        .bold()
                        .foregroundColor(.black)
                    Image(systemName: isPasswordDropdownOpen ? "chevron.down" : "chevron.left")
                        .foregroundColor(.black)
                }.padding()
                
                if isPasswordDropdownOpen {
                    PopperSecureField(placeholder: "Current Password", text: $currentPassword)
                    
                    PopperSecureField(placeholder: "New Password", text: $newPassword)
                }
                //TODO: Popravi ovo smece
                if isEditingProfilePicture == true && isPasswordDropdownOpen == false {
                    VStack {
                        Spacer()
                        Button(action: {
                            //TODO: Handle take a pic
                        }) {
                            Text("Take a Picture")
                                .foregroundColor(.black)
                        }
                        .padding()
                        
                        Divider()
                        
                        Button(action: {
                            //TODO: Handle choose a pic from gallery
                        }) {
                            Text("Choose from Gallery")
                                .foregroundColor(.black)
                        }
                        
                    }
                    .padding()
                }
            }
            .padding(.top, 25)
            .padding(.horizontal)
            
            Spacer()
        }
    }
}





#Preview {
    EditProfileView()
}
