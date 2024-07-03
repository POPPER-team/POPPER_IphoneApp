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
    let post: PostDto
    var player: AVPlayer
    @State private var isShowingComments = false
    @State private var isSharing = false
    @StateObject private var viewModel = UserViewModel()
    @State private var likes: Int
    @State private var isLiked = false
    @State private var saves: Int
    @State private var isSaved = false
    @StateObject var userModel = UserAPI()
    @StateObject var mediaModel = PostApi()
    init (post: PostDto, player: AVPlayer){
        self.post = post
        likes = post.likes
        saves = post.savedCount
        self.player = player
    }


    
    var body: some View {
        ZStack {
  //          if(post.mediaGuid != nil){
  //              CustomVideoPlayer(player: player)
  //                  .containerRelativeFrame([.horizontal, .vertical])
  //          }
  //          else {
  //              HStack{
  //                  Text(post.ingredients!.map{
  //                      $0.name
  //                  }
  //                      .joined(separator: "/n"))
  //                  .foregroundStyle(.white)
  //              }
  //          }
  
            Rectangle()
                .fill(.red)
                .frame(minWidth: 400, maxWidth: .infinity, minHeight: 850, maxHeight: .infinity, alignment: .center)
                .clipped()
                .opacity(0.6)
            
            HStack{
                if (mediaModel.postMedia != nil){
                    Image(uiImage: UIImage(data: mediaModel.postMedia!)!)
                        .resizable()
                }
                else{
                    Image(uiImage: UIImage(systemName: "carrot")!)
                        .resizable()
                        .frame(width: 300, height: 340)
                }
            }
            
            VStack{
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text(userModel.user?.username ?? "\("user" + gen_rnd.formatted())")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        Text(post.title)
                            .foregroundStyle(.black)
                            .onAppear(){
                                userModel.GetUserDetails(UserGuid: post.userGuid) 
                                if(post.mediaGuid != nil){
                                    mediaModel.GetMedia(guid: post.mediaGuid!);
                                }
                                
                            }
                        Text(post.description ?? "")
                            .foregroundStyle(.black)
                        Text(post.ingredients!.map{
                            $0.name
                        }
                            .joined(separator: "/n"))
                        .foregroundStyle(.black)

                    }
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28) {
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
                                            .foregroundStyle(isLiked ? .red : .black)
                                        
                                        Text("\(post.likes)")
                                            .font(.caption)
                                            .foregroundStyle(.black)
                                            .bold()
                                    }
                                }
                            
                        Button {
                            isShowingComments.toggle()
                        } label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.black)
                                
                                Text(Int.random(in: 1..<30).formatted())
                                    .font(.caption)
                                    .foregroundStyle(.black)
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
                                            .foregroundStyle(isSaved ? .yellow : .black)
                                        
                                        Text("\(saves)")
                                            .font(.caption)
                                            .foregroundStyle(.black)
                                            .bold()
                                    }
                                }
                        /*Button {
                            isSharing.toggle()
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
                            //SearchView(viewModel: viewModel)
                            UserSearchView()
                        }*/
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
    FeedCell(post : PostDto(guid: NSUUID().uuidString, title: "NASLOV", description: "bok", mediaGuid: NSUUID().uuidString, duration: "", userGuid: NSUUID().uuidString, likes: 20 , savedCount: 30, viewCount:100, comments: nil, ingredients: [IngridientDto(guid: NSUUID().uuidString, name: "ingredient", amount: "20g")], steps: nil), player: AVPlayer())
}
