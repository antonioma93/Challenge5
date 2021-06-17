//
//  UsersData.swift
//  Challenge5
//
//  Created by Massa Antonio on 17/06/21.
//

import Foundation

class UsersData: ObservableObject {
    @Published var arrayOfUsers = [User]()
    
    init () {
        let stringUrl = "https://www.hackingwithswift.com/samples/friendface.json"
        
        guard let url = URL(string: stringUrl) else {return}
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print("No data in response \(error?.localizedDescription ?? "No data response!")")
                return
            }
            if let decoderUser = try? JSONDecoder().decode([User].self, from: data) {
                self.arrayOfUsers = decoderUser
            }
        }
        .resume()
    }
    
    func findUser(string: String) -> User {
        guard let firstUser = self.arrayOfUsers.first(where: { (oneUser) -> Bool in
            oneUser.id == string
        }) else {
            return self.arrayOfUsers.first!
        }
        return firstUser
    }
}
