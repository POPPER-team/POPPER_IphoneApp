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
        VStack {
            TextField("Search by username", text: $searchText, onCommit: {
                userManager.searchUser(username: searchText)
            })
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())

            //List(userManager.users) { user in
                //VStack(alignment: .leading) {
                    //Text(user.username).font(.headline)
                //}
            //}
            
            ForEach(userManager.users, id: \.guid) { user in
                VStack(alignment: .leading) {
                    Text(user.username).font(.headline)
                }
            }
        }
        .padding()
    }
}

struct UserSearchView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchView()
    }
}

