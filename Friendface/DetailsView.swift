//
//  DetailsView.swift
//  Friendface
//
//  Created by sebastian.popa on 1/7/24.
//

import SwiftUI

struct DetailsView: View {
    
    var user : User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Active: ")
                Image(systemName: "circle.fill")
                    .foregroundStyle(user.isActive ? .green : .red)
                    .font(.caption)
            }
            Text("Age: \(user.age)")
            Text("Company: \(user.company)")
            Text("Email: \(user.email)")
            Text("Address: \(user.address)")
            Text("Member since: \(user.registered.formatted())")
            HStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(user.friends, id: \.id) { friend in
                            VStack {
                                Image(systemName: "person")
                                    .font(.largeTitle)
                                Text(friend.name)
                                    .font(.title2)
                            }
                        }
                    }
                }
                .frame(maxHeight: 200)
            }
            Spacer()
        }
        .navigationTitle(user.name)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 8) {
                            ForEach(user.tags, id: \.self) { tag in
                                Text(tag)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .padding(8)
                                    .background(.gray.opacity(0.1))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    DetailsView(user: User(id: UUID(), isActive: true, name: "Andrew Chicken", age: 23, company: "EA Games", email: "andrewchicken@gmail.com", address: "Jupiter Street no. 6", about: "Andrew is a dedicated, hardworker individual who excels in the field of QA, having a proven record of high quality results.", registered: .now, tags: ["Worker", "Socialbe"], friends: [Friend(id: UUID(), name: "Alexander the Priest"), Friend(id: UUID(), name: "Ralu Shein"), Friend(id: UUID(), name: "George Villager")]))
}
