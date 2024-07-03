//
//  PostGridView.swift
//  Demo
//
//  Created by Matija Lukanić on 21.03.2024..
//

import SwiftUI

struct PostGridView: View {
    @StateObject public var postApi : PostApi = PostApi()
    let userGuid:String
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    private let width = (UIScreen.main.bounds.width / 3) - 2
    var body: some View {
        LazyVGrid(columns:items  ,spacing: 2) {
            if(postApi.posts == nil){
                Text("loading...").padding(20)

            }
            else{
                ForEach(postApi.posts!, id: \.guid) {
                    post in  
                    if postApi.postMedia != nil{
                        if let img = UIImage(data: postApi.postMedia!) {
                            Image(uiImage: img)
                                .frame(width: width, height: 160)
                                .clipped()
                            
                        }
                        else{
                            ZStack{
                                Rectangle()
                                    .frame(width: width, height: 160)
                                    .clipped()
                                    .onAppear(){
                                        postApi.GetMedia(guid: post.guid)
                                    }
                                Text(post.title)
                            }
                        }
                    }
                    else{
                        Rectangle()
                            .frame(width: width, height: 160)
                            .clipped()
                            .onAppear(){
                                postApi.GetMedia(guid: post.guid)
                            }
                    }
                }
            }
            }
        .onAppear(){
            postApi.GetPostUsers(guid: userGuid)
        }
        }
    }


//#Preview {PostGridView(posts: [PostDto(guid: NSUUID().uuidString, title: "NASLOV", description: "bok", mediaGuid: NSUUID().uuidString, duration: "", userGuid: NSUUID().uuidString, likes: 20 , savedCount: 30, viewCount:100, comments: nil, ingredients: [IngridientDto(guid: NSUUID().uuidString, name: "ingredient", amount: "20g")], steps: nil), PostDto(guid: NSUUID().uuidString, title: "NASLOV", description: "bok", mediaGuid: NSUUID().uuidString, duration: "", userGuid: NSUUID().uuidString, likes: 20 , savedCount: 30, viewCount:100, comments: nil, ingredients: [IngridientDto(guid: NSUUID().uuidString, name: "ingredient", amount: "20g")], steps: nil),PostDto(guid: NSUUID().uuidString, title: "NASLOV", description: "bok", mediaGuid: NSUUID().uuidString, duration: "", userGuid: NSUUID().uuidString, likes: 20 , savedCount: 30, viewCount:100, comments: nil, ingredients: [IngridientDto(guid: NSUUID().uuidString, name: "ingredient", amount: "20g")], steps: nil), PostDto(guid: NSUUID().uuidString, title: "NASLOV", description: "bok", mediaGuid: NSUUID().uuidString, duration: "", userGuid: NSUUID().uuidString, likes: 20 , savedCount: 30, viewCount:100, comments: nil, ingredients: [IngridientDto(guid: NSUUID().uuidString, name: "ingredient", amount: "20g")], steps: nil),PostDto(guid: NSUUID().uuidString, title: "NASLOV", description: "bok", mediaGuid: NSUUID().uuidString, duration: "", userGuid: NSUUID().uuidString, likes: 20 , savedCount: 30, viewCount:100, comments: nil, ingredients: [IngridientDto(guid: NSUUID().uuidString, name: "ingredient", amount: "20g")], steps: nil), PostDto(guid: NSUUID().uuidString, title: "NASLOV", description: "bok", mediaGuid: NSUUID().uuidString, duration: "", userGuid: NSUUID().uuidString, likes: 20 , savedCount: 30, viewCount:100, comments: nil, ingredients: [IngridientDto(guid: NSUUID().uuidString, name: "ingredient", amount: "20g")], steps: nil)])}
