//
//  UserView.swift
//  Challenge5
//
//  Created by Massa Antonio on 17/06/21.
//

import SwiftUI

struct UserView: View {
    var user: User
    var users: UsersData
    @State private var isShowFriendList = false
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                Text(user.name)
            }
            
            Section(header: Text("Age")) {
                Text("\(user.age)")
            }
            
            Section(header: Text("Company")) {
                Text(user.company)
            }
            
            Section(header: Text("is Active")) {
                Text(user.checkIsActive)
            }
            
            Section(header: Text("Switch to show friends")) {
                Toggle(isOn: $isShowFriendList) {
                    Text("Show \(user.name)'s friend")
                }
            }
            if isShowFriendList {
                Section(header: Text("\(user.name)'s friends")) {
                    NavigationLink(destination: FriendView(users: self.users, user: self.user)) {
                        Text("Show \(user.name)'s friends")
                    }
                }
            }
        }
        .navigationBarTitle(Text("User: \(user.name)"), displayMode: .inline)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(id: "ID", isActive: true, name: "Name", age: 27, company: "COM", email: "email", address: "address", about: "about", friends: [Friend]()), users: UsersData())
    }
}
