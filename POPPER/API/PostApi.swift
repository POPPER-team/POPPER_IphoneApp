//
//  PostApi.swift
//  POPPER
//
//  Created by Lorena Kovačić on 03.07.2024..
//

import Foundation
class PostApi : ObservableObject{
    @Published public var posts:[PostDto]? = nil
    @Published public var postMedia: Data? = nil
    
    func GetPosts(){
        let path = "/Post/GetRecommendedPosts";
        conn.getRequest(path:path){
            data, respons, error in
            if let data = data {
                if let post = try? JSONDecoder().decode([PostDto].self, from:data)
                {
                    DispatchQueue.main.async {
                        self.posts = post
                    }
                }
                
                else {
                    print ("error decoding json")
                }
            }
        }
    }
    
    func GetMedia(guid : String){
        let path = "/Post/GetPostMedia/\(guid)";
        conn.getRequest(path:path){
            data, respons, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.postMedia = data
                }}
            else {
                print ("error decoding json")
            }
        }
    }
    
    
    func GetPost(guid : String){
        
    }
    
    func GetPostUsers(guid :String){
        
    }
    
    func GetSavedPosts(guid: String){
        
    }
    
}
