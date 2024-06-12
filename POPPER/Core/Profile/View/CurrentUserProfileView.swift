//
//  CurrentUserProfileView.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 2){
                    ProfileHeaderView()
                    
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
    CurrentUserProfileView()
}
