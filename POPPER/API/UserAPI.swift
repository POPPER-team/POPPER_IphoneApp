//
//  UserAPI.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.05.2024..
//

import Foundation

class UserAPI {
    
    func GetYourData(userEscape: @escaping (UserDetailsDto?) -> ()) {
        let urlPath = "/UserDetails/GetYourData";
        
        conn.getRequest(path: urlPath) {
            data, response, error in
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(UserDetailsDto.self, from: data)
                    userEscape(user)
                } catch {
                    print("Error decoding JSON: \(error)")
                    userEscape(nil)
                }

            }
            else{
                print(error)
                userEscape(nil)
            }
        }
    }
}
