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
    @State private var isSharing = false
    @StateObject private var viewModel = UserViewModel()
    private var user = UserControl.getUser()
    @State private var likes: Int = Int.random(in: 1..<1000)
    @State private var isLiked = false
    @State private var saves: Int = Int.random(in: 1..<50)
    @State private var isSaved = false
    
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
                        Text(user?.username.lowercased() ?? "\("user" + gen_rnd.formatted())")
                        .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28) {
                        
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                            .overlay(
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                                    .foregroundStyle(.white)
                            )
                            Button(action: {
                                    isLiked.toggle()
                                    if isLiked {
                                        likes+=1
                                    } else {
                                        likes-=1
                                    }
                                }) {
                                    VStack {
                                        Image(systemName: isLiked ? "heart.fill" : "heart.fill")
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                            .foregroundStyle(isLiked ? .red : .white)
                                        
                                        Text("\(likes)")
                                            .font(.caption)
                                            .foregroundStyle(.white)
                                            .bold()
                                    }
                                }
                            
                        Button {
                            
                        } label: {
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
                        Button(action: {
                                    isSaved.toggle()
                                    if isSaved {
                                        saves+=1
                                    } else {
                                        saves-=1
                                    }
                                }) {
                                    VStack {
                                        Image(systemName: isSaved ? "bookmark.fill" : "bookmark.fill")
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                            .foregroundStyle(isSaved ? .yellow : .white)
                                        
                                        Text("\(saves)")
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
                        }.sheet(isPresented: $isSharing) {
                            SearchView(viewModel: viewModel)
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
