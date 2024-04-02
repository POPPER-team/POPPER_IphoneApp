//
//  NotificationCell.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct NotificationCell: View {
    var gen_rnd = Int.random(in: 1..<1000)
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .frame(width: 32, height: 32)
                .foregroundStyle(Color(.systemGray5))
            HStack{
                Text("user" + gen_rnd.formatted())
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("liked one of your posts")
                    .font(.footnote)
                Text(Int.random(in: 1..<10).formatted() + "d")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
