//
//  DontWorryYumApp.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/10/24.
//

import SwiftUI

@main
struct DontWorryYumApp: App {
    @State private var navigationManager = NavigationManager.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationManager.path) {
                AppView()
                    .background(Color.BG)
                    .navigationDestination(for: PathType.self) {
                        $0.NavigatingView()
                    }
            }
        }
    }
}
