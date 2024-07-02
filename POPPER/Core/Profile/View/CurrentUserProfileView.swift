//
//  CurrentUserProfileView.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct CurrentUserProfileView: View {
    public let userGuid: String
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 2){
                    //Salji usera
                    ProfileHeaderView(userGuid: userGuid)
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentUserProfileView(userGuid: "2123")
}
