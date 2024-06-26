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
    "http://localhost:5029/api";
    
    var jwtToken: String = ""
    var refreshToken: String = ""
    
    func getRequest(path: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: baseUrl + path)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        task.resume()
    }
    
    func postRequest(path: String, body:Codable?, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: baseUrl + path)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if body != nil{
            request.httpBody = try? JSONEncoder().encode(body.unsafelyUnwrapped)
        }
            
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        
        task.resume()
    }
    
    func putRequest(path: String, body: [DataField], completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: baseUrl + path)!
        var requestForm = MultipartFormDataRequest(url: url)
        
        for field in body{
            requestForm.addDataField(named: field.name, data: field.data, mimeType: field.mimeType)
        }
            var request = requestForm.asURLRequest();
            request.httpMethod = "PUT"
            request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                completion(data, response, error)
            }
            
            task.resume()
        }
        
        func deleteRequest(path: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            let url = URL(string: baseUrl + path)!
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                completion(data, response, error)
            }
            
            task.resume()
        }
    }

