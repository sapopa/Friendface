//
//  ContentView.swift
//  Friendface
//
//  Created by sebastian.popa on 1/7/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \User.name) private var users: [User]
    
    var body: some View {
        NavigationView {
            VStack {
                List(users, id: \.id) { user in
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundStyle(user.isActive ? .green : .red)
                            .font(.caption)
                        NavigationLink(user.name, destination: DetailsView(user: user))
                    }
                }
            }
            .navigationTitle("Friendface")
        }
        .task {
            await fetchData()
        }
    }
    
    func fetchData() async{
        // for the purpose of this project, the list is constant, so avoiding fetching the data on every refresh is a good thing in this scenario
        guard users.isEmpty else { return }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(for: request)
            
            let decodedData = try decoder.decode([User].self, from: data)
            
            let insertContext = ModelContext(modelContext.container)
            
            for user in decodedData {
                insertContext.insert(user)
            }
            
            try insertContext.save()
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
