//
//  RegisterView.swift
//  Demo
//
//  Created by Matija Lukanić on 03.04.2024..
//

import SwiftUI

struct RegisterView: View {
    @State var firstName = "";
    @State var lastName = "";
    @State private var email_username = ""
    @State private var password = ""
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("POPPER")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    
                    TextField("First name", text: $firstName)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(20)
                    .bold()
                    
                    TextField("Last name", text: $lastName)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(20)
                    .bold()
                    
                    TextField("Email or username", text: $email_username)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(20)
                    .bold()
                
                    SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(20)
                    .bold()
                    
                    SecureField("Repeat password", text: $password)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(20)
                    .bold()
                    
                    HStack{
                        Text("Already have an account?")
                            .bold()
                        NavigationLink(destination: LoginView()){
                            Text("Login")
                                .foregroundColor(.purple)
                                .bold()
                        }
                    }
                    VStack{
                        Spacer()
                        Button("Register")
                        {
                        createUser(email_username: email_username, password: password)
                        }
                        .foregroundColor(.black)
                        .frame(width: 350, height: 50)
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(20)
                        .bold()
                        .navigationDestination(isPresented:$showingLoginScreen)
                        {
                            MainTabView()
                            //setaj na true kasnije
                            .navigationBarBackButtonHidden(false)
                        }.padding(.bottom, 50)
                    }.edgesIgnoringSafeArea(.bottom)
                }.padding(.top, 150)
            }.navigationBarHidden(true)
        }
    }
    
    func createUser(email_username: String, password: String) {
        showingLoginScreen = true
    }
}

#Preview {
    RegisterView()
}
