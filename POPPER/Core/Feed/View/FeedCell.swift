//
//  FeedCell.swift
//  Demo
//
//  Created by Matija Lukanić on 20.03.2024..
//

import SwiftUI
import AVKit

struct FeedCell: View {
    var gen_rnd = Int.random(in: 1..<1000)
    let post: Post
    var player: AVPlayer
    @State private var isShowingComments = false
    init (post: Post, player: AVPlayer){
        self.post = post
        self.player = player
    }
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
            
            VStack{
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("user" + gen_rnd.formatted())
                            .fontWeight(.semibold)
                        Text(String(repeating: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", count: 2))
                            .lineLimit(3)
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28) {
                        
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                        
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text(Int.random(in: 1..<1000).formatted())
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        Button(action: {
                            isShowingComments.toggle()
                        }) {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text(Int.random(in: 1..<30).formatted())
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }.sheet(isPresented: $isShowingComments) {
                            CommentSectionView()
                        }
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "bookmark.fill")
                                    .resizable()
                                    .frame(width: 22, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text(Int.random(in: 1..<46).formatted())
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "arrowshape.turn.up.right.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text(Int.random(in: 1..<21).formatted())
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                    }
                    .padding(.bottom, 60)
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onTapGesture(){
            switch player.timeControlStatus{
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
    }
}

#Preview {
    FeedCell(post: Post(id: NSUUID().uuidString, videoUrl: ""), player: AVPlayer())
}
