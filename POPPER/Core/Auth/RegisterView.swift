//
//  RegisterView.swift
//  Demo
//
//  Created by Matija Lukanić on 03.04.2024..
//

import SwiftUI

struct RegisterView: View {
    let authenticateUser: () -> Void
    @State var firstName = "";
    @State var lastName = "";
    @State private var emailOrUsername = ""
    @State private var password = ""
    
        
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("logo-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    Text("POPPER")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    
                    PopperInputField(placeholder: "First name", text: $firstName)
                    
                    PopperInputField(placeholder: "Last name", text: $lastName)
                    
                    PopperInputField(placeholder: "Email or username", text: $emailOrUsername)
                
                    PopperSecureField(placeholder: "Password", text: $password)
                    
                    PopperSecureField(placeholder: "Repeat password", text: $password)
                    
                    HStack{
                        Text("Already have an account?")
                            .bold()
                        NavigationLink(destination: LoginView(authenticateUser: authenticateUser)){
                            Text("Login")
                                .foregroundColor(.purple)
                                .bold()
                        }
                    }
                    VStack{
                        Spacer()
                        PopperButton(buttonText: "Register", onClick: authenticateUser)
                            .padding(.bottom, 50)
                    }.edgesIgnoringSafeArea(.bottom)
                }.padding(.top, 50)
            }.navigationBarHidden(true)
        }
    }
}

#Preview {
    RegisterView(authenticateUser: {})
}
