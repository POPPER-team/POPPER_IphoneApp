//
//  SearchView.swift
//  POPPER
//
//  Created by Matija Lukanić on 02.06.2024..
//

import Foundation
import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search users", text: $viewModel.searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(viewModel.filteredUsers) { user in
                    HStack {
                        Text(user.username)
                        Spacer()
                        Button(action: {
                            viewModel.toggleSelection(for: user)
                        }) {
                            Image(systemName: user.isSelected ? "checkmark.square.fill" : "square")
                                .foregroundColor(user.isSelected ? .blue : .gray)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                Button(action: {
                    // Handle send action
                    print("Selected users: \(viewModel.users.filter { $0.isSelected })")
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Send")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarTitle("Search Users", displayMode: .inline)
        }
    }
}

