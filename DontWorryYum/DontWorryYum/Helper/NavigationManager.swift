//
//  NavigationManager.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/10/24.
//

import SwiftUI

enum PathType: Hashable {
    case nickname
    case week
    case main
    case search
    case list(category: Category)
    case food(food: Food)
}

extension PathType {
    @ViewBuilder
    func NavigatingView() -> some View {
        switch self {
        case .nickname:
            NickNameView()
        case .week:
            WeeksView()
        case .main:
            MainView()
        case .search:
            SearchView()
        case .list(let category):
            ListView(category: category)
        case .food(let food):
            FoodView(food: food)
        }
    }
}

@Observable
class NavigationManager {
    static let shared = NavigationManager()
    private init() {}
    
    var path: [PathType] = []
}

extension NavigationManager {
    func push(to pathType: PathType) {
        path.append(pathType)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
    
    func pop(to pathType: PathType) {
        guard let lastIndex = path.lastIndex(of: pathType) else { return }
        path.removeLast(path.count - (lastIndex + 1))
    }
}
