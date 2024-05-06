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
        let url = "/UserAuthentication/Login"
        //TODO doesnt mapp data
        let body = ["username": username, "password": password]
        //TODO json data needs to have from-form look
        //https://sagar-r-kothari.github.io/swift/2020/02/20/Swift-Form-Data-Request.html
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        conn.postRequest(url: url, body: jsonData!) { data, response, error in
            if let data = data {
                //TODO handle error for now it will just hit can't decode it should display error
                if let tokens = try? JSONDecoder().decode(TokensDto.self, from: data){
                    conn.jwtToken = tokens.jwtToken
                    conn.refreshToken = tokens.refreshToken
                    
                }
                else {print("Cant decode data")}
            }
            else{
                print(error)
            }}
        
            return true
    }
    
    func register(username: String, password: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = "/UserAuthentication/register"
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
