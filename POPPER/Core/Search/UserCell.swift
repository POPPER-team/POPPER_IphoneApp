//
//  UserCell.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct UserCell: View{

@State private var user:UserDto;
@StateObject var userApi = UserAPI();
    init( User:UserDto){
    self.user = User
}
    var body: some View {
        HStack(spacing: 12){
            if  userApi.profilePicure != nil
            {
                Image(uiImage: UIImage(data: userApi.profilePicure!)!)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
            }
            else{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(Color(.systemGray))
            }
            VStack(alignment: .leading){
                Text(user.username)
                    .font(.headline)
                Text(user.firstName + " " + user.lastName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }.onAppear(){
            userApi.GetProfilePicture(UserGuid: user.guid)
        }
    }
}
#Preview {
    UserCell(
        User:
            UserDto(
                username: "test",
                guid: UUID().uuidString,
                email: "test.test@test.test",
                firstName: "John",
                lastName: "Doe"
            )
    )
}
