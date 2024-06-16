//
//  UserAuthenticationAPI.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//
import Foundation

class UserAuthApi
 {
    
    func login(username: String, password: String, tokensEscape: @escaping (TokensDto?) -> ()) {
        let urlPath = "/UserAuthentication/Login";
    
        var url = URLComponents();
        url.queryItems = [URLQueryItem(name: "Username", value: username), URLQueryItem(name: "Password", value: password)]
        url.path = urlPath
        
        conn.postRequest(path: url.string!, body: nil){data, response, error in
            if let data = data {
                if let tokens = try? JSONDecoder().decode(TokensDto.self, from: data){
                    tokensEscape(tokens)
                }
                else {
                    print("Cant decode data")
                    tokensEscape(nil)
                }
            }
            else{
                tokensEscape(nil)
                print(error)
            }
        }
    }
    
    func register(newUser:NewUserDto, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = "/UserAuthentication/register"
        conn.postRequest(path: url, body: newUser) { data, response, error in
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
