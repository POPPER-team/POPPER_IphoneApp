//
//  CurrentUserProfileView.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct CurrentUserProfileView: View {
    public let userGuid: String?
    @StateObject var userApi = UserAPI();
    
    init(userGuid: String?){
        self.userGuid = userGuid
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 2){
                    if userApi.user == nil {
                        Text("loading...").padding(20)
                    } else {
                        ProfileHeaderView(user: userApi.user)
                        PostGridView()
                    }
                    
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(){
            if userGuid == nil {
                userApi.GetYourData()
            }
            else{
                userApi.GetUserDetails(UserGuid: userGuid!)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(userGuid: "2123")
}
