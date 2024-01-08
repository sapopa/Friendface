//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by sebastian.popa on 1/7/24.
//

import SwiftUI
import SwiftData

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
