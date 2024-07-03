//
//  FeedView.swift
//  Demo
//
//  Created by Matija Lukanić on 20.03.2024..
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    @StateObject var postModel = PostApi()
    
    var body: some View {
        
        ScrollView{
            if(postModel.posts == nil){
            VStack (alignment : .center, spacing: 300){
                    Spacer()
                    Text("Loading...")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                        .onAppear{
                            postModel.GetPosts()
                        }
                }
            }
            else{
                LazyVStack(spacing: 0){
                    ForEach(postModel.posts.unsafelyUnwrapped, id: \.guid) {
                        post in
                        FeedCell(post: post, player: player)
                        .id(post.guid)
                        .onAppear {
                            playInitialVideoIfNecessary()
                            if(post.mediaGuid != nil){
                                //postModel.GetMedia(guid: post.mediaGuid!)
                            }
                        }
                    }
                }
                .scrollTargetLayout()
            }
            
        } .onAppear{player.play()}
            .scrollPosition(id: $scrollPosition)
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
            .onChange(of: scrollPosition){
                oldValue , newValue in playVideoOnChangeOfScrollPosition(postId: newValue)
            }
    }
        
        func playInitialVideoIfNecessary(){
            guard
                scrollPosition == nil,
                let post = viewModel.posts.first,
                player.currentItem == nil else { return }
            
            let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
            player.replaceCurrentItem(with: item)
        }
        
        func playVideoOnChangeOfScrollPosition(postId: String?){
            guard let currentPost = viewModel.posts.first(where: { $0.id == postId}) else { return }
            
            player.replaceCurrentItem(with: nil)
            let playerItem = AVPlayerItem(url:URL(string: currentPost.videoUrl)!)
            player.replaceCurrentItem(with: playerItem)
        
    }
}

#Preview {
    FeedView()
}
