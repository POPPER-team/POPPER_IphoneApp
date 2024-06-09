//
//  RegisterView.swift
//  Demo
//
//  Created by Matija Lukanić on 03.04.2024..
//

import SwiftUI

struct RegisterView: View {
    let authenticateUser: (UserDetailsDto) -> Void
    @State var firstName = "";
    @State var lastName = "";
    @State var username = ""
    @State var password = ""
    let userAuth = api.userAuth;

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
                    
                    PopperInputField(placeholder: "Username", text: $username)
                
                    PopperSecureField(placeholder: "Password", text: $password)
                    
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
                        PopperLoadingButton(buttonText: "Register", onClick: {
                            sleep(2);
                            
                            let newUser = NewUserDto(username: username,
                                                     password: password,
                                                     firstName: firstName,
                                                     lastName: lastName);
                            
                            userAuth.register(newUser: newUser){data, response, error in 
                                if data == data{
                                    userAuth.login(username: username, password: password){
                                        data in
                                        if let tokens = data{
                                            conn.jwtToken = tokens.jwtToken
                                            conn.refreshToken = tokens.refreshToken
                                            UserAPI().GetYourData(){user in
                                                if user != nil{
                                                    print("User: \(user?.username)")
                                                    authenticateUser(user!);
                                                }
                                                else{
                                                    print("Error getting user")
                                                }
                                            }
                                        }
                                    }
                                }   }

                        })
                        .padding(.bottom, 50)
                    }.edgesIgnoringSafeArea(.bottom)
                }.padding(.top, 50)
            }.navigationBarHidden(true)
        }
    }
}

#Preview {
    RegisterView(authenticateUser: {_ in })
}
