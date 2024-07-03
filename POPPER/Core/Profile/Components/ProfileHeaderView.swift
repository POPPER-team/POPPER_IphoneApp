//
//  ProfileHeaderView.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var isEditingProfile = false
    private var user: UserDetailsDto?
    @StateObject var userApi = UserAPI();
    @StateObject var userControl = UserControl()
    @State public var isMyProfile: Bool;
    @Binding var userBool: Bool;
    @State private var isFollowing: Bool
    
    init(user: UserDetailsDto?, isMyProfile: Bool = false, userBool: Binding<Bool>? = .constant(false), isFollowing: Bool = false){
        self.user = user as UserDetailsDto?
        self.isMyProfile = isMyProfile
        self._userBool = userBool ?? .constant(false)
        self.isFollowing = isFollowing
        
    }
    
    var gen_rnd = Int.random(in: 1..<1000)
    
    
    var body: some View {
        VStack(spacing: 16){
            VStack(spacing: 8){
                if  userApi.profilePicure != nil, let pic = UIImage(data: userApi.profilePicure!)
                {
                    Image(uiImage: pic)
                        .resizable()
                        .frame(width: 72, height: 72)
                        .clipShape(Circle())
                }
                else{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 72, height: 72)
                        .foregroundStyle(Color(.systemGray))
                }
                
                Text(user?.username ?? "\("user" + gen_rnd.formatted())")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }.onAppear(){
                userApi.GetProfilePicture(UserGuid: user?.guid ?? "")
                userApi.GetFollowers()
            }
            
            HStack(spacing: 16){
                //TODO: Add real data
                UserStatView(value: user?.following ?? gen_rnd, title: "Following")
                UserStatView(value: user?.followers ?? gen_rnd, title: "Followers")
                UserStatView(value: Int.random(in: 1500..<6500), title: "Likes")
                
            }
            if isMyProfile
            {
                PopperButton(buttonText: "Edit Profile", onClick: {
                    isEditingProfile.toggle()
                })
                .sheet(isPresented: $isEditingProfile, content: {
                    EditProfileView(user: user!,userBool: $userBool)
                })
            }
            else
            {
                
                if (isFollowing) {
                    PopperButton(buttonText: "Unfollow", onClick: {
                        userApi.UnFollowUser(FollowingGuid: user?.guid ?? "")
                        isFollowing = false;
                    }).background(Color.red)
                        .cornerRadius(20)
                }
                else{
                    PopperButton(buttonText: "Follow", onClick: {
                        userApi.FollowUser(FollowingGuid: user?.guid ?? "")
                        isFollowing = true;
                    })
                }
            }
        }
        
        Divider()
    }
}

#Preview {
    ProfileHeaderView(user: nil)
}

