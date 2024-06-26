//
//  UserCell.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct UserCell: View {
    var gen_rnd = Int.random(in: 1..<1000)
    private var user = UserControl.getUser()
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray))
            
            VStack(alignment: .leading){
                Text(user?.username.lowercased() ?? "\("user" + gen_rnd.formatted())")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(user?.username.lowercased() ?? "\("user" + gen_rnd.formatted())")
                    .font(.footnote)
            }
            Spacer()
        }
    }
}

#Preview {
    UserCell()
}
