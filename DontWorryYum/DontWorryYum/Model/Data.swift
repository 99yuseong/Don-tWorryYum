//
//  Data.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import Foundation

struct Data {
    static let recommendNutrients: [[String]] = [
        ["Lacto", "No limit"],
        ["Folic acid", "600mg"],
        ["Omega 3", "500mg"],
        ["Calcium", "700mg"],
        ["Vitamin D", "10µg"]
    ]
    
    static let mainEvaluation: Evaluation = .init(never: 12, rarely: 23, often: 43, usually: 25)
}
