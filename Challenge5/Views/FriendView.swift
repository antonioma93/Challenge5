//
//  FriendView.swift
//  Challenge5
//
//  Created by Massa Antonio on 17/06/21.
//

import SwiftUI

struct FriendView: View {
    var users: UsersData
    var user: User
    
    var body: some View {
        List(user.friends) { friend in
            NavigationLink(destination: UserView(user: self.users.findUser(string: friend.id), users: self.users)) {
                VStack(alignment: .leading, spacing: nil) {
                    Text(friend.name)
                }
            }
        }
        .navigationBarTitle("\(self.user.name)'s friends", displayMode: .inline)
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(users: UsersData(), user: User(id: "ID", isActive: true, name: "Name", age: 27, company: "COM", email: "email", address: "address", about: "about", friends: [Friend]()))
    }
}
