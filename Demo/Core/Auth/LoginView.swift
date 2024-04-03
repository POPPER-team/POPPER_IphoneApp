//
//  LoginView.swift
//  Demo
//
//  Created by Matija Lukanić on 03.04.2024..
//

import SwiftUI

struct LoginView: View {
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
                    
                    TextField("Email or username", text: $email_username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(20)
                    .bold()
                
                    SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(20)
                    .bold()
                    
                    HStack{
                        Text("Don't have an account?")
                            .bold()
                        NavigationLink(destination: RegisterView()){
                            Text("Register")
                                .foregroundColor(.purple)
                                .bold()
                        }
                    }
                    VStack{
                        Spacer()
                        Button("Login")
                        {
                        authenticateUser(email_username: email_username, password: password)
                        }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
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
                }.padding(.top, 250)
            }.navigationBarHidden(true)
        }
    }
    
    func authenticateUser(email_username: String, password: String) {
        showingLoginScreen = true
    }
}

#Preview {
    LoginView()
}
