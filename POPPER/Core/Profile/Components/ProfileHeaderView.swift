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
    public let isMyProfile: Bool;

    init(user: UserDetailsDto?, isMyProfile: Bool = false){
        self.user = user as UserDetailsDto?
    self.isMyProfile = isMyProfile
        
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
                        .frame(width: 48, height: 48)
                        .foregroundStyle(Color(.systemGray))
                }
                
                Text(user?.username ?? "\("user" + gen_rnd.formatted())")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }.onAppear(){
                userApi.GetProfilePicture(UserGuid: user?.guid ?? "")
            }
            
            HStack(spacing: 16){
                //TODO: Add real data
                UserStatView(value: Int.random(in: 100..<150), title: "Following")
                UserStatView(value: Int.random(in: 150..<300), title: "Followers")
                UserStatView(value: Int.random(in: 1500..<6500), title: "Likes")
                
            }
            if isMyProfile
            {
                PopperButton(buttonText: "Edit Profile", onClick: {
                    isEditingProfile.toggle()
                })
                .sheet(isPresented: $isEditingProfile, content: {
                    EditProfileView(user: user!)
                })
            }
            else
            {
                PopperButton(buttonText: "Follow", onClick: {
                    print("Followed")
                })
            }
            
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: nil)
}

