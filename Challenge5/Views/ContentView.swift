//
//  ContentView.swift
//  Challenge5
//
//  Created by Massa Antonio on 17/06/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var users = UsersData()
    
    var body: some View {
        Text("")
        NavigationView {
            List(users.arrayOfUsers) { user in
                NavigationLink(destination: UserView(user: user, users: self.users)) {
                    HStack {
                        Text("\(user.checkIsActive)")
                        VStack(alignment: .leading, spacing: nil) {
                            Text(user.name)
                                .font(.headline)
                            Text("Age: \(user.age)")
                        }
                    }
                }
            }
            .navigationBarTitle("User List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
