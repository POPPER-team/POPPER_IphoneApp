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
    @StateObject var userControl = UserControl();
    public let isMyProfile: Bool
    
    init(userGuid: String?, isMyProfile: Bool = false){
        self.userGuid = userGuid
        self.isMyProfile = isMyProfile
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 2){
                    if userApi.user == nil {
                        Text("loading...").padding(20)
                    } else {
                        ProfileHeaderView(user: userApi.user, isMyProfile: isMyProfile)
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
