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
    
    init(user: UserDetailsDto) {
        self.username = user.username
        self.bio = user.status ?? ""
        self.dob = user.dateOfBirth ?? ""
        self.website = user.webLink ?? ""
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
                PopperInputField(placeholder: "Bio", text: $bio)
                PopperInputField(placeholder: "DOB", text: $dob)
                PopperInputField(placeholder: "Website", text: $website)
                
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
                            //TODO: Popravi ovo smece
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
                }.sheet(isPresented: $IsChoosingPicture){
                    PopperImagePicker(image:self.$profilePicture);
        }
    }
}





#Preview {
    EditProfileView(user: UserDetailsDto(username: "Test", guid: "", firstName: "Ime", lastName: "Prezime", created: "12.12.2001", dateOfBirth: "12.12.2001.", status: "dadadadadada", webLink: "www.google.com"))
}
