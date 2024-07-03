//
//  UserAPI.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.05.2024..
//

import Foundation

class UserAPI:ObservableObject {
    @Published var user: UserDetailsDto? = nil
    @Published var profilePicure: Data? = nil
    @Published var followers: [UserDto]? = nil
    @Published var likes: Int = 1
    
    func GetYourData() {
        let urlPath = "/UserDetails/GetYourData";
        
        conn.getRequest(path: urlPath) {
            data, response, error in
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(UserDetailsDto.self, from: data)
                    DispatchQueue.main.async {
                        self.user = user
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            }
            else{
                print(error)
            }
        }
    }
    
    func GetUserDetails(UserGuid: String) {
        let urlPath = "/UserDetails/GetUser/\(UserGuid)";
        
        conn.getRequest(path: urlPath) {
            data, response, error in
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(UserDetailsDto.self, from: data)
                    DispatchQueue.main.async {
                        self.user = user
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            }
            else{
                print(error)
            }
        }
    }
    
    func GetProfilePicture(UserGuid: String) {
        let urlPath = "/UserDetails/DownloadProfilePicture?userGuid=\(UserGuid)";
        
        conn.getRequest(path: urlPath) {
            data, response, error in
            if let data = data {
                do {
                    DispatchQueue.main.async {
                        self.profilePicure = data
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            }
            else{
                print(error)
            }
        }
    }
    
    func FollowUser(FollowingGuid: String) {
        let urlPath = "/Follow/FollowUser/\(FollowingGuid)";
        
        conn.postRequest(path: urlPath, body: nil) {
            data, response, error in
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(UserDetailsDto.self, from: data)
                    DispatchQueue.main.async {
                        self.user = user
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            }
            else{
                print(error)
            }
        }
    }
    
    func UnFollowUser(FollowingGuid: String) {
        let urlPath = "/Follow/UnFollowUser/\(FollowingGuid)";
        
        conn.deleteRequest(path: urlPath) {
            data, response, error in
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(UserDetailsDto.self, from: data)
                    DispatchQueue.main.async {
                        self.user = user
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            }
            else{
                print(error)
            }
        }
    }
    
    func GetFollowers() {
        let urlPath = "/Follow/GetFollowers";
        
        conn.getRequest(path: urlPath) {
            data, response, error in
            if let data = data {
                do {
                    let followers = try JSONDecoder().decode([UserDto].self, from: data)
                    DispatchQueue.main.async {
                        self.followers = followers
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            }
            else{
                print(error)
            }
        }
    }
    
    func GetFollowing() {
        let urlPath = "/Follow/GetFollowing";
        
        conn.getRequest(path: urlPath) {
            data, response, error in
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(UserDetailsDto.self, from: data)
                    DispatchQueue.main.async {
                        self.user = user
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            }
            
        }
    }
    func uploadProfileImage(imageData: DataField) {
        let urlPath = "/UserDetails/UploadProfilePicture";
        conn.putRequest(path: urlPath, field:imageData){
            data, response, error in
            if let data = data {
                do {
                    print("success");
                    
                }
            }
        }
    }
    func changePassword(oldPassword: String, newPassword: String)
    {
        let urlPath = "/UserAuthentication/ChangePassword";
        
        var url = URLComponents();
        url.queryItems = [URLQueryItem(name: "oldPassword", value: oldPassword), URLQueryItem(name: "newPassword", value: newPassword)]
        url.path = urlPath
        
        conn.postRequest(path: url.string!, body: nil) {
            data, response, error in
            if let data = data {
                do {
                    print("success");
                }
            }
        }
    }
    func likePost(UserGuid: String)
    {
        let urlPath = "/PostActions/LikePost/\(UserGuid)";
        
        conn.postRequest(path: urlPath, body: nil) {
            data, response, error in
            if let data = data {
                do {
                    let likes = try JSONDecoder().decode(Int.self, from: data)
                    DispatchQueue.main.async {
                        self.likes = likes
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            else{
                print(error)
            }
        }
    }
}
