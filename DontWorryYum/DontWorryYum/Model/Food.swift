//
//  Food.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/10/24.


import SwiftUI

enum Category: Int {
    case meatAndEggs = 0
    case seaFoodAndDried = 1
    case veggieAndFruits = 2
    case grainsAndNuts = 3
    case dairyProducts = 4
    case coffeeAndTea = 5
    
    var description: String {
        switch self {
        case .meatAndEggs:
            "Meat ∙ Eggs"
        case .seaFoodAndDried:
            "Sea Food ∙ Dried Food"
        case .veggieAndFruits:
            "Veggie ∙ Fruits"
        case .grainsAndNuts:
            "Grains  ∙ Nuts"
        case .dairyProducts:
            "Dairy Products"
        case .coffeeAndTea:
            "Coffee ∙ Tea"
        }
    }
}

struct Food: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var category: Category
    var evaluation: Evaluation
    var nutrients: [Nutrient]
    var keywords: [String]
    var cautions: String
    var amountOnce: String
    
    static func mock() -> [Food] {
        [
            Food(
                name: "Seaweed soup1",
                category: .seaFoodAndDried,
                evaluation: Evaluation.mock(),
                nutrients: Nutrient.mock(),
                keywords: [
                    "Blood Circulation",
                    "Uterine Contraction",
                    "Hemostasis"
                ],
                cautions: "The caffeine in Americano can affect the development of a pregnant woman's fetus, and excessive caffeine consumption can increase the risk of miscarriage, low birth weight, and premature birth, so caution is required. Experts recommend that pregnant women limit themselves to less than 200 mg of caffeine per day, or about one cup of Americano.",
                amountOnce: "1 cup(180ml)"
            ),
            Food(
                name: "Seaweed soup2",
                category: .seaFoodAndDried,
                evaluation: Evaluation.mock(),
                nutrients: Nutrient.mock(),
                keywords: [
                    "Blood Circulation",
                    "Uterine Contraction",
                    "Hemostasis"
                ],
                cautions: "The caffeine in Americano can affect the development of a pregnant woman's fetus, and excessive caffeine consumption can increase the risk of miscarriage, low birth weight, and premature birth, so caution is required. Experts recommend that pregnant women limit themselves to less than 200 mg of caffeine per day, or about one cup of Americano.",
                amountOnce: "1 cup(180ml)"
            ),
            Food(
                name: "Seaweed soup3",
                category: .seaFoodAndDried,
                evaluation: Evaluation.mock(),
                nutrients: Nutrient.mock(),
                keywords: [
                    "Blood Circulation",
                    "Uterine Contraction",
                    "Hemostasis"
                ],
                cautions: "The caffeine in Americano can affect the development of a pregnant woman's fetus, and excessive caffeine consumption can increase the risk of miscarriage, low birth weight, and premature birth, so caution is required. Experts recommend that pregnant women limit themselves to less than 200 mg of caffeine per day, or about one cup of Americano.",
                amountOnce: "1 cup(180ml)"
            )
        ]
    }
}

struct Nutrient: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var unit: String
    var amount: Float
    var recommendIntake: Float
    var maxIntake: Float
    var isImportant: Bool
    
    static func mock() -> [Nutrient] {
        [
            Nutrient(
                name: "Caffeine",
                unit: "mg",
                amount: 160,
                recommendIntake: 300,
                maxIntake: 500,
                isImportant: true
            ),
            Nutrient(
                name: "Caffeine",
                unit: "mg",
                amount: 160,
                recommendIntake: 300,
                maxIntake: 500,
                isImportant: true
            ),
            Nutrient(
                name: "Caffeine",
                unit: "mg",
                amount: 160,
                recommendIntake: 300,
                maxIntake: 500,
                isImportant: true
            ),
            Nutrient(
                name: "Caffeine",
                unit: "mg",
                amount: 160,
                recommendIntake: 300,
                maxIntake: 500,
                isImportant: true
            )
        ]
    }
}

struct Evaluation: Hashable {
    var never: EvaluationOption
    var rarely: EvaluationOption
    var often: EvaluationOption
    var usually: EvaluationOption
    
    var max: EvaluationOption {
        [self.never, self.rarely, self.often, self.usually].max()!
    }
    
    var total: Int {
        [self.never, self.rarely, self.often, self.usually]
            .map { $0.count }
            .reduce(0, +)
    }
    
    init(never: Int, rarely: Int, often: Int, usually: Int) {
        self.never = .init(count: never, color: .usNever)
        self.rarely = .init(count: rarely, color: .usRarely)
        self.often = .init(count: often, color: .usOften)
        self.usually = .init(count: usually, color: .usUsually)
    }
    
    static func mock() -> Evaluation {
        Evaluation(
            never: 12, rarely: 34, often: 12, usually: 34
        )
    }
}

struct EvaluationOption: Comparable, Hashable {
    var count: Int
    var color: Color
    
    static func ==(lhs: EvaluationOption, rhs: EvaluationOption) -> Bool {
        return lhs.count == rhs.count
    }
    
    static func <(lhs: EvaluationOption, rhs: EvaluationOption) -> Bool {
        return lhs.count < rhs.count
    }
}
