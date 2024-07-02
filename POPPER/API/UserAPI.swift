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
}
