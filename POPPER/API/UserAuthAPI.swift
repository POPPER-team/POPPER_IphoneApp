//
//  UserAuthenticationAPI.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//

import Foundation

class UserAuthApi
 {
    
    func login(username: String, password: String) -> Bool {
        let url = "/Login"
        let body = ["username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        conn.postRequest(url: url, body: jsonData!) { data, response, error in
            if let data = data {
                let tokens = try? JSONDecoder().decode(TokensDto.self, from: data)
                conn.jwtToken = tokens!.jwtToken
                conn.refreshToken = tokens!.refreshToken
            }
            else{
                print(error)
            }
        }
        return true
    }
    
    func register(username: String, password: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = "/register"
        let body = ["username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        conn.postRequest(url: url, body: jsonData!) { data, response, error in
            completion(data, response, error)
        }
    }
    
//    func refreshToken(completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        let url = "/refresh"
//        let body = ["refreshToken": connection.refreshToken]
//        let jsonData = try? JSONSerialization.data(withJSONObject: body)
//        connection.postRequest(url: url, body: jsonData!) { data, response, error in
//            completion(data, response, error)
//        }
//    }
    
}
