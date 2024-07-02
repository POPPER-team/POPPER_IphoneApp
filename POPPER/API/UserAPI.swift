//
//  UserAPI.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.05.2024..
//

import Foundation

class UserAPI:ObservableObject {
    @Published var user: UserDetailsDto? = nil

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
}
