//
//  LoginView.swift
//  Demo
//
//  Created by Matija Lukanić on 03.04.2024..
//

import SwiftUI

struct LoginView: View {
    let authenticateUser: (UserDetailsDto) -> Void
    @State private var username = ""
    @State private var password = ""
    let userAuth = api.userAuth;
    @State private var showingAlert = false
    
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
                    
                    PopperInputField(placeholder: "Username", text: $username)
                
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
                        PopperLoadingButton(buttonText: "Login", onClick: {
                            sleep(2);
                                userAuth.login(username: username, password: password){data in
                                    if let tokens = data{
                                        conn.jwtToken = tokens.jwtToken
                                        conn.refreshToken = tokens.refreshToken
                                        //TODO: get user, set user, move to feed
                                        UserAPI().GetYourData(){user in
                                            if user != nil{
                                                print("User: \(user?.username)")
                                                authenticateUser(user!);
                                            }
                                            else{
                                                print("Error getting user")
                                            }
                                        }
                                        //NavigationLink(destination: FeedView())
                                    }
                                    else{
                                        showingAlert = true
                                    }
                            }

                        })
                        .padding(.bottom, 50)
                    }.edgesIgnoringSafeArea(.bottom)
                }.padding(.top, 100)
            }.navigationBarHidden(true)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Invalid username or password"), dismissButton: .default(Text("Got it!")))
                }
        }
    }
}

#Preview {
    LoginView(authenticateUser: {_ in })
}
