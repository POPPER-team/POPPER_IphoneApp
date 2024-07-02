//
//  UserManager.swift
//  POPPER
//
//  Created by Matija Lukanić on 15.06.2024..
//

import Foundation

class UserManager: ObservableObject {
    @Published var users: [UserDto] = []

    func searchUser(username: String) {
        let urlPath = "/UserDetails/SearchUser"

        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name: "searchString", value: username)]
        urlComponents.path = urlPath

        guard let urlString = urlComponents.string, let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        conn.getRequest(path: urlString)
        { data, response, error in
            if let data = data {
                do {
                    let users = try JSONDecoder().decode([UserDto].self, from: data)
                    DispatchQueue.main.async {
                        self.users = users
                    }
                } catch {
                    print(urlString)
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
}

