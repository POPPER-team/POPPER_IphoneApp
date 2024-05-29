//
//  ProfileHeaderView.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var isEditingProfile = false
    private var user = UserControl.getUser()
    var gen_rnd = Int.random(in: 1..<1000)
    var body: some View {
        VStack(spacing: 16){
            VStack(spacing: 8){
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray))
                
                Text("@user" + gen_rnd.formatted())
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            HStack(spacing: 16){
                UserStatView(value: Int.random(in: 100..<150), title: "Following")
                UserStatView(value: Int.random(in: 150..<300), title: "Followers")
                UserStatView(value: Int.random(in: 1500..<6500), title: "Likes")
                
            }
            
            PopperButton(buttonText: "Edit Profile", onClick: {
                isEditingProfile.toggle()
            })
            .sheet(isPresented: $isEditingProfile, content: {
                EditProfileView(user: user!)
            })
            
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView()
}

