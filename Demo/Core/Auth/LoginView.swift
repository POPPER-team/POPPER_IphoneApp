//
//  LoginView.swift
//  Demo
//
//  Created by Matija Lukanić on 03.04.2024..
//

import SwiftUI

struct LoginView: View {
    let authenticateUser: () -> Void
    @State private var emailOrUsername = ""
    @State private var password = ""
    @State private var showingLoginScreen = false
      
    
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
                    
                    PopperInputField(placeholder: "Email or username", text: $emailOrUsername)
                
                    PopperSecureField(placeholder: "Password", text: $password)
                    
                    HStack{
                        Text("Don't have an account?")
                            .bold()
                        NavigationLink(destination: RegisterView(authenticateUser: authenticateUser)){
                            Text("Register")
                                .foregroundColor(.purple)
                                .bold()
                        }
                    }
                    VStack{
                        Spacer()
                        PopperButton(buttonText: "Login", onClick: authenticateUser, isPresented: $showingLoginScreen)
                            .padding(.bottom, 50)
                    }.edgesIgnoringSafeArea(.bottom)
                }.padding(.top, 100)
            }.navigationBarHidden(true)
        }
    }
}

#Preview {
    LoginView(authenticateUser: {})
}
