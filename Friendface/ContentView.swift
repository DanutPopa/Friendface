//
//  ContentView.swift
//  Friendface
//
//  Created by Danut Popa on 25.09.2024.
//

import SwiftUI

struct ContentView: View {
   @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                NavigationLink {
                    UserView(user: user)
                } label: {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.callout)
                            .fontWeight(.semibold)
                        
                        Text(user.isActive == true ? "Online" : "Offline")
                            .foregroundStyle(user.isActive == true ? .green : .red)
                            .fontWeight(.medium)
                            .font(.subheadline)
                    }
                }

            }
            .navigationTitle("Friendface")
            .toolbar {
                Button("Show Friends") {
                    Task {
                        await fetchFriends()
                    }
                }
            }
        }
    }
    
    func fetchFriends() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
        
        do {
            if users.isEmpty {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let decoded = try? decoder.decode([User].self, from: data) {
                    users = decoded
                }
            }
        } catch {
            print("There was an error downloading the data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
