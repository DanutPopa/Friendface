//
//  DetailView.swift
//  Friendface
//
//  Created by Danut Popa on 26.09.2024.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("Something about me")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(user.about)
                    .font(.headline)
                    .fontWeight(.light)
                
                Spacer()
                
                Text("My friends:")
                    .font(.title)
                    .fontWeight(.semibold)
                
                ForEach(user.friends, id: \.id) { friend in
                    Text(friend.name)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
            }
            .padding(.horizontal)
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    UserView(user: User(id: "12341", isActive: true, name: "Johnny", age: 12, company: "dsakmdsa", email: "ksdamd", address: "askdmasdk", about: "Very friendly", registered: "123921-129394-12", tags: [" "], friends: [Friend(id: "99213", name: "John Wick")]))
}
