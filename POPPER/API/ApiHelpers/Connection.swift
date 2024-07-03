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
    
    func putRequest(path: String, field: DataField, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: baseUrl + path)!
        // Generate a unique boundary string
        let boundary = UUID().uuidString

        // Set up the URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("Bearer \(conn.jwtToken)", forHTTPHeaderField: "Authorization")
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        // Get the file data (e.g., from a local file URL)
        let fileName = field.name
        let mimetype = field.mimeType
        let paramName = "file"
        let fileData = field.data

        // Create the multipart/form-data body
        var data = field.data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: \(mimetype)\r\n\r\n".data(using: .utf8)!)
        data.append(fileData)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Set the content length
        request.setValue(String(field.data.count), forHTTPHeaderField: "Content-Length")

        // Perform the upload
        let session = URLSession.shared
        session.uploadTask(with: request, from: data) { (data, response, error) in
            // Handle the server response
            if let error = error {
                print("Error uploading file: \(error)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                print("Upload successful! Status code: \(response.statusCode)")
                // Handle the response data (if needed)
            }
        }.resume()

        // Function to determine MIME type based on file extension
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

