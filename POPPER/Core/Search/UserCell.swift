//
//  UserCell.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct UserCell: View{

@State private var user:UserDto;

init( User:UserDto ){
    self.user = User
}
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray))
            
            VStack(alignment: .leading){
                Text(user.username)
                    .font(.headline)
                Text(user.firstName + " " + user.lastName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
    }
}

#Preview {
    UserCell(
        User:
            UserDto(
                username: "user1",
                guid: UUID().uuidString,
                email: "test.test@test.test",
                firstName: "John",
                lastName: "Doe"
            )
        
    )
}
