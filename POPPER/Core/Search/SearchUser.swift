//
//  SearchUser.swift
//  POPPER
//
//  Created by Matija Lukanić on 15.06.2024..
//

import Foundation
import SwiftUI

struct UserSearchView: View {
    @StateObject private var userManager = UserManager()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            LazyVStack{
                TextField("Search by username", text: $searchText, onCommit: {
                    userManager.searchUser(username: searchText)
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                ForEach(userManager.users, id: \.guid) { user in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: CurrentUserProfileView(userGuid: user.guid)) {
                            UserCell(User: user)
                        }
                    }
                    .padding()
                }}
        }
    }}

struct UserSearchView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchView()
    }
}
