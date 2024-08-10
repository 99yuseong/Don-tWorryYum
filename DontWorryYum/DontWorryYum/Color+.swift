//
//  Color+.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import SwiftUI

extension Color {
    static var random: Color {
        switch Int.random(in: 0..<3) {
        case 0: .usRarely
        case 1: .usOften
        default: .usUsually
        }
    }
}
