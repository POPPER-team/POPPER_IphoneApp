//
//  ExploreView.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                UserSearchView()
                LazyVStack(spacing: 16){
                    ForEach(0..<20){
                        user in
                        UserCell()
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top, 8)
        }
    }
}

#Preview {
    ExploreView()
}
