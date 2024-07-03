//
//  EditProfileView.swift
//  POPPER
//
//  Created by Matija Lukanić on 14.04.2024..
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var profilePicture:Image?;
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var username:String
    @State private var bio:String
    @State private var dob:String
    @State private var website:String
    @State private var isPasswordDropdownOpen = false
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var isEditingProfilePicture = false
    @State private var IsChoosingPicture = false
    @Binding var userBool: Bool

    init(user: UserDetailsDto, userBool: Binding<Bool>){
        self.username = user.username
        self.bio = user.status ?? ""
        self.dob = user.dateOfBirth ?? ""
        self.website = user.webLink ?? ""
        self._userBool = userBool
    };
    
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
                
                Text("Settings")
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
                    if(profilePicture == nil){
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color(.systemGray))

                    }
                    else {
                        profilePicture!
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color(.systemGray))
                    }
            
            PopperButton(buttonText: "Edit picture", onClick: {
                isEditingProfilePicture.toggle()
                if(isPasswordDropdownOpen) {
                    isPasswordDropdownOpen = false;
                }
            })
            
            
            VStack(alignment: .leading, spacing: 20) {

                PopperInputField(placeholder: "Name", text: $username)
                
                Button(action: {
                    isPasswordDropdownOpen.toggle()
                    isEditingProfilePicture = false
                }) {
                    Text("CHANGE PASSWORD")
                        .bold()
                        .foregroundColor(.black)
                    Image(systemName: isPasswordDropdownOpen ? "chevron.down" : "chevron.left")
                        .foregroundColor(.black)
                        .animation(.snappy, value: isPasswordDropdownOpen)

                }.padding()
              
                
            }
            .padding(.top, 25)
            .padding(.horizontal)
                    VStack {
                        if isPasswordDropdownOpen {
                            PopperSecureField(placeholder: "Current Password", text: $currentPassword)
                                .animation(.easeIn, value: isPasswordDropdownOpen)
                            
                            PopperSecureField(placeholder: "New Password", text: $newPassword)
                                .animation(.easeIn, value: isPasswordDropdownOpen)
                        }
                            if isEditingProfilePicture == true{

                                PopperButton(buttonText: "Take a picture"){}
                   
                                PopperButton(buttonText: "Choose from gallery",onClick: {
   
                                    IsChoosingPicture.toggle()
                                })
                            }
                        
                        }
                        .animation(.easeIn, value: isEditingProfilePicture)
                        .padding()
                    
            Spacer()
                    PopperButton(buttonText: "Logout", onClick: {
            
                        conn.jwtToken = ""
                        conn.refreshToken = ""
                        userBool.toggle()
                        self.presentationMode.wrappedValue.dismiss()
                    })
                        
                }.sheet(isPresented: $IsChoosingPicture){
                    PopperImagePicker(image:self.$profilePicture);
        }
    }
}





#Preview {
    EditProfileView(user: UserDetailsDto(username: "Test", guid: "", firstName: "Ime", lastName: "Prezime", created: "12.12.2001"), userBool: Binding<Bool>.constant(false))
}
