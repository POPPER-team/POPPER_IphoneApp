//
//  Connection.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//

import Foundation

let conn = Conn();

class Conn {
    var baseUrl = 
   //"https://localhost:7163/api"
    //TODO https needs certificate error -1202 need to add certificate
    "http://localhost:5029/api"
    
    var jwtToken: String = ""
    var refreshToken: String = ""
    
    func getRequest(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: baseUrl + url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        
        task.resume()
    }
    
    func postRequest(url: String, body: Data, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: baseUrl + url)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        
        task.resume()
    }
    
    func putRequest(url: String, body: Data, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: baseUrl + url)!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = body
        request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        
        task.resume()
    }
    
    func deleteRequest(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: baseUrl + url)!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        
        task.resume()
    }
}
