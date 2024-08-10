//
//  AppView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import SwiftUI

enum AppState {
    case splash
    case info
    case main
}

struct AppView: View {
    @State private var isFirst: Bool = true
    @State private var appState: AppState = .splash
    
    var body: some View {
        ZStack {
            switch appState {
            case .splash:
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation {
                                self.appState = .info
                                self.isFirst = false
                            }
                        }
                    }
            case .info:
                IntroView()
            case .main:
                MainView()
            }
        }
        .onAppear {
            if !isFirst {
                appState = .main
            }
        }
    }
}

#Preview {
    AppView()
}
