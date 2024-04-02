//
//  NotificationsView.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing:24){
                    ForEach(0..<10){
                        notification in
                        NotificationCell()
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    NotificationsView()
}
