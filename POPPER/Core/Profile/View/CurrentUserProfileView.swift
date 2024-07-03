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
    @Binding var userBool: Bool
    @State private var isFollowing: Bool
    @StateObject var postApi = PostApi()
    
    
    init(userGuid: String?, isMyProfile: Bool = false, userBool: Binding<Bool>? = .constant(false), isFollowing: Bool = false){
        self.userGuid = userGuid
        self.isMyProfile = isMyProfile
        self._userBool = userBool ?? .constant(false)
        self.isFollowing = isFollowing
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 2){
                    if userApi.user == nil {
                        Text("loading...").padding(20)

                    } else {
                        ProfileHeaderView(user: userApi.user, isMyProfile: isMyProfile, userBool: $userBool, isFollowing: isFollowing)
                            
                        if(userGuid != nil){
                            PostGridView(userGuid: userGuid!)
                        }

                    }
                    
                }
                .onAppear(){
                    if(userGuid != nil){
                        postApi.GetPostUsers(guid: userGuid!)
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
