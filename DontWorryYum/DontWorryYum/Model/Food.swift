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
                name: "Beef Tartare",
                category: .seaFoodAndDried,
                evaluation: Evaluation(never: 23, rarely: 32, often: 12, usually: 5),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 20,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Iron",
                        unit: "g",
                        amount: 2.5,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Vitamin B12",
                        unit: "μg",
                        amount: 2,
                        recommendIntake: 2.6,
                        maxIntake: 2.6,
                        isImportant: true
                    ),
                    .init(
                        name: "Zinc",
                        unit: "mg",
                        amount: 4,
                        recommendIntake: 10.5,
                        maxIntake: 35,
                        isImportant: true
                    ),
                    .init(
                        name: "Selenium",
                        unit: "μg",
                        amount: 20,
                        recommendIntake: 64,
                        maxIntake: 64,
                        isImportant: true
                    ),
                ],
                keywords: ["Fetal growth and development", "Anemia prevention"],
                cautions: "High risk of parasitic infection and food poisoning. Avoid raw meat and consume only fully cooked foods to protect both the mother and baby.",
                amountOnce: "100g"
            ),
            Food(
                name: "Grilled Short Rib Patties",
                category: .meatAndEggs,
                evaluation: Evaluation(never: 12, rarely: 25, often: 13, usually: 6),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 15,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 25,
                        recommendIntake: 50,
                        maxIntake: 50,
                        isImportant: true
                    ),
                    .init(
                        name: "Sodium",
                        unit: "mg",
                        amount: 750,
                        recommendIntake: 1500,
                        maxIntake: 1500,
                        isImportant: true
                    ),
                    .init(
                        name: "Carbohydrates",
                        unit: "g",
                        amount: 10,
                        recommendIntake: 20,
                        maxIntake: 20,
                        isImportant: true
                    )
                ],
                keywords: ["Energy supply"],
                cautions: "High in sodium, and depending on the meat quality, may be high in cholesterol. Avoid overeating and consider healthier snack alternatives.",
                amountOnce: "100g"
            ),
            Food(
                name: "Eggs",
                category: .meatAndEggs,
                evaluation: Evaluation(never: 0, rarely: 6, often: 33, usually: 34),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 6,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 5,
                        recommendIntake: 50,
                        maxIntake: 50,
                        isImportant: true
                    ),
                    .init(
                        name: "Vitamin B12",
                        unit: "μg",
                        amount: 0.5,
                        recommendIntake: 2.6,
                        maxIntake: 2.6,
                        isImportant: true
                    ),
                    .init(
                        name: "Carbohydrates",
                        unit: "g",
                        amount: 1,
                        recommendIntake: 20,
                        maxIntake: 20,
                        isImportant: true
                    )
                ],
                keywords: ["Fetal brain development", "Bone health"],
                cautions: "Eating raw eggs can lead to salmonella infection. Always cook eggs thoroughly before consuming.",
                amountOnce: "100g"
            ),
            Food(
                name: "Chicken",
                category: .meatAndEggs,
                evaluation: Evaluation(never: 2, rarely: 12, often: 43, usually: 12),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 27,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Iron",
                        unit: "mg",
                        amount: 5,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    )
                ],
                keywords: ["Fetal brain development", "Blood production"],
                cautions: "Chicken skin is high in fat; it's better to remove it and eat only the lean meat. Avoid cooking methods that make it too greasy.",
                amountOnce: "100g"
            ),
            Food(
                name: "Duck Meat",
                category: .meatAndEggs,
                evaluation: Evaluation(never: 12, rarely: 32, often: 23, usually: 12),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 19,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 5,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Vitamin B12",
                        unit: "μg",
                        amount: 0.4,
                        recommendIntake: 2.6,
                        maxIntake: 2.6,
                        isImportant: true
                    )
                ],
                keywords: ["Fetal growth and development"," Cardiovascular health"],
                cautions: "Duck meat is high in fat, so it's not advisable to eat it too often. Consume it occasionally and combine it with other low-fat proteins.",
                amountOnce: "100g"
            ),
            Food(
                name: "Salmon",
                category: .seaFoodAndDried,
                evaluation: Evaluation(never: 2, rarely: 24, often: 23, usually: 17),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 20,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 13,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Omega-3",
                        unit: "g",
                        amount: 2.5,
                        recommendIntake: 500,
                        maxIntake: 2000,
                        isImportant: true
                    ),
                    .init(
                        name: "Vitamin D",
                        unit: "IU",
                        amount: 2.5,
                        recommendIntake: 10,
                        maxIntake: 10,
                        isImportant: true
                    )
                ],
                keywords: ["Fetal brain development", "Cardiovascular health"],
                cautions: "May contain high levels of mercury. Avoid frequent consumption and make sure to cook it thoroughly before eating.",
                amountOnce: "100g"
            ),
            Food(
                name: "Mackerel",
                category: .seaFoodAndDried,
                evaluation: Evaluation(never: 4, rarely: 8, often: 32, usually: 23),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 18,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 13,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Omega-3",
                        unit: "g",
                        amount: 2,
                        recommendIntake: 500,
                        maxIntake: 2000,
                        isImportant: true
                    ),
                    .init(
                        name: "Vitamin D",
                        unit: "IU",
                        amount: 450,
                        recommendIntake: 720,
                        maxIntake: 3000,
                        isImportant: true
                    )
                ],
                keywords: ["Fetal brain development", "Cardiovascular health"],
                cautions: "May contain high levels of mercury. Limit your intake, and like salmon, make sure it is well-cooked before consumption.",
                amountOnce: "100g"
            ),
            Food(
                name: "Shrimp",
                category: .seaFoodAndDried,
                evaluation: Evaluation(never: 3, rarely: 24, often: 23, usually: 23),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 20,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 0.5,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Zinc",
                        unit: "mg",
                        amount: 1.3,
                        recommendIntake: 10.5,
                        maxIntake: 35,
                        isImportant: true
                    ),
                    .init(
                        name: "Selenium",
                        unit: "μg",
                        amount: 40,
                        recommendIntake: 64,
                        maxIntake: 64,
                        isImportant: true
                    )
                ],
                keywords: ["Muscle growth", "Immune system support"],
                cautions: "May cause allergic reactions and is high in cholesterol. Be cautious and monitor for any allergic responses.",
                amountOnce: "100g"
            ),
            Food(
                name: "Shellfish",
                category: .seaFoodAndDried,
                evaluation: Evaluation(never: 4, rarely: 23, often: 32, usually: 23),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 10,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Iron",
                        unit: "mg",
                        amount: 0.5,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Zinc",
                        unit: "mg",
                        amount: 2,
                        recommendIntake: 10.5,
                        maxIntake: 35,
                        isImportant: true
                    ),
                    .init(
                        name: "Selenium",
                        unit: "μg",
                        amount: 45,
                        recommendIntake: 64,
                        maxIntake: 64,
                        isImportant: true
                    )
                ],
                keywords: ["Muscle growth", "Immune system support"],
                cautions: "Risk of allergies and food poisoning. Purchase fresh shellfish and ensure it is thoroughly cooked before consumption.",
                amountOnce: "100g"
            ),
            Food(
                name: "Mozzarella cheese",
                category: .dairyProducts,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 22,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 17,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Calcium",
                        unit: "mg",
                        amount: 505,
                        recommendIntake: 700,
                        maxIntake: 2500,
                        isImportant: true
                    )
                ],
                keywords: ["Protein", "Calcium"],
                cautions: "Mozzarella cheese is safe for pregnant women, but always consume fresh products and limit the intake.",
                amountOnce: "100g"
            ),
            Food(
                name: "Cheddar Cheese",
                category: .dairyProducts,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 25,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 33,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Calcium",
                        unit: "mg",
                        amount: 721,
                        recommendIntake: 700,
                        maxIntake: 2500,
                        isImportant: true
                    )
                ],
                keywords: ["Protein", "Calcium"],
                cautions: "Like Mozzarella cheese, it is a safe choice but avoid overconsumption.",
                amountOnce: "100g"
            ),
            Food(
                name: "Camembert Cheese",
                category: .dairyProducts,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 19,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 212,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Calcium",
                        unit: "mg",
                        amount: 388,
                        recommendIntake: 700,
                        maxIntake: 2500,
                        isImportant: true
                    )
                ],
                keywords: ["Protein", "Calcium"],
                cautions: "Non-pasteurized cheese can carry the risk of listeria infection, which is very dangerous for pregnant women and their babies. Avoid consuming.",
                amountOnce: "100g"
            ),
            Food(
                name: "Milk",
                category: .dairyProducts,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 3.2,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 3.4,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Calcium",
                        unit: "mg",
                        amount: 120,
                        recommendIntake: 700,
                        maxIntake: 2500,
                        isImportant: true
                    )
                ],
                keywords: ["Protein", "Calcium", "Bone health"],
                cautions: "If lactose intolerant, it may be difficult to consume. Some milk may contain residual hormones, so opt for pasteurized milk or alternatives.",
                amountOnce: "100ml"
            ),
            Food(
                name: "Soda",
                category: .coffeeAndTea,
                evaluation: Evaluation(never: 28, rarely: 18, often: 16, usually: 7),
                nutrients: [
                    .init(
                        name: "Carbohydrates",
                        unit: "g",
                        amount: 11,
                        recommendIntake: 100,
                        maxIntake: 100,
                        isImportant: true
                    ),
                    .init(
                        name: "Sodium",
                        unit: "mg",
                        amount: 20,
                        recommendIntake: 1500,
                        maxIntake: 1500,
                        isImportant: true
                    )
                ],
                keywords: [],
                cautions: "High sugar content can lead to weight gain, obesity, and gestational diabetes. Opt for water or healthier beverages whenever possible.",
                amountOnce: "100ml"
            ),
            Food(
                name: "Coffee",
                category: .coffeeAndTea,
                evaluation: Evaluation(never: 16, rarely: 18, often: 12, usually: 7),
                nutrients: [
                    .init(
                        name: "Caffeine",
                        unit: "mg",
                        amount: 95,
                        recommendIntake: 100,
                        maxIntake: 300,
                        isImportant: true
                    ),
                    .init(
                        name: "Potassium",
                        unit: "mg",
                        amount: 116,
                        recommendIntake: 3500,
                        maxIntake: 3500,
                        isImportant: true
                    )
                ],
                keywords: [],
                cautions: "High caffeine content can cause anxiety, insomnia, and increased heart rate. It also interferes with iron absorption; limit intake to one cup a day.",
                amountOnce: "100ml"
            ),
            Food(
                name: "Green Tea",
                category: .coffeeAndTea,
                evaluation: Evaluation(never: 10, rarely: 18, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Caffeine",
                        unit: "mg",
                        amount: 25,
                        recommendIntake: 100,
                        maxIntake: 300,
                        isImportant: true
                    ),
                    .init(
                        name: "Polyphenols",
                        unit: "mg",
                        amount: 100,
                        recommendIntake: 1000,
                        maxIntake: 1000,
                        isImportant: true
                    )
                ],
                keywords: ["Antioxidant effects"],
                cautions: "Green tea also contains caffeine. Excessive intake can cause anxiety and insomnia, so drink it in moderation.",
                amountOnce: "100ml"
            ),
            Food(
                name: "Energy Drink",
                category: .coffeeAndTea,
                evaluation: Evaluation(never: 30, rarely: 18, often: 24, usually: 14),
                nutrients: [
                    .init(
                        name: "Caffeine",
                        unit: "mg",
                        amount: 80,
                        recommendIntake: 100,
                        maxIntake: 300,
                        isImportant: true
                    ),
                    .init(
                        name: "Niacin",
                        unit: "mg",
                        amount: 16,
                        recommendIntake: 100,
                        maxIntake: 100,
                        isImportant: true
                    ),
                    .init(
                        name: "Sugar",
                        unit: "g",
                        amount: 27,
                        recommendIntake: 100,
                        maxIntake: 100,
                        isImportant: true
                    )
                ],
                keywords: [],
                cautions: "High caffeine content and other ingredients with unverified safety. It's best to avoid consuming.",
                amountOnce: "100ml"
            ),
            Food(
                name: "Spinach",
                category: .veggieAndFruits,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Iron",
                        unit: "mg",
                        amount: 2.7,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    ),
                    .init(
                        name: "Folate",
                        unit: "μg",
                        amount: 194,
                        recommendIntake: 1500,
                        maxIntake: 1500,
                        isImportant: true
                    ),
                    .init(
                        name: "Vitamin K",
                        unit: "μg",
                        amount: 483,
                        recommendIntake: 1500,
                        maxIntake: 1500,
                        isImportant: true
                    )
                ],
                keywords: ["Anemia prevention", "Fetal neural tube formation", "Blood clotting"],
                cautions: "Contains oxalates which can interfere with calcium absorption. Pair with other foods to enhance calcium absorption.",
                amountOnce: "100g"
            ),
            Food(
                name: "Tomato",
                category: .veggieAndFruits,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Vitamin C",
                        unit: "mg",
                        amount: 13.7,
                        recommendIntake: 100,
                        maxIntake: 100,
                        isImportant: true
                    ),
                    .init(
                        name: "Potassium",
                        unit: "mg",
                        amount: 237,
                        recommendIntake: 600,
                        maxIntake: 1500,
                        isImportant: true
                    ),
                    .init(
                        name: "Lycopene",
                        unit: "μg",
                        amount: 2573,
                        recommendIntake: 3000,
                        maxIntake: 3000,
                        isImportant: true
                    )
                ],
                keywords: ["Immune system support", "Blood pressure regulation", "Antioxidant effects"],
                cautions: "Generally safe, but can cause heartburn if consumed in large amounts.",
                amountOnce: "100g"
            ),
            Food(
                name: "Sweet Potato",
                category: .grainsAndNuts,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Beta-carotene",
                        unit: "μg",
                        amount: 8509,
                        recommendIntake: 10000,
                        maxIntake: 10000,
                        isImportant: true
                    ),
                    .init(
                        name: "Dietary Fiber",
                        unit: "g",
                        amount: 3.0,
                        recommendIntake: 30,
                        maxIntake: 30,
                        isImportant: true
                    ),
                    .init(
                        name: "Potassium",
                        unit: "mg",
                        amount: 337,
                        recommendIntake: 1500,
                        maxIntake: 3000,
                        isImportant: true
                    )
                ],
                keywords: ["Antioxidant effects", "Constipation prevention", "Blood pressure regulation"],
                cautions: "Good for digestion but avoid overeating. Maintaining a balanced diet is crucial.",
                amountOnce: "100g"
            ),
            Food(
                name: "Potato",
                category: .grainsAndNuts,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Vitamin C",
                        unit: "mg",
                        amount: 19.7,
                        recommendIntake: 100,
                        maxIntake: 100,
                        isImportant: true
                    ),
                    .init(
                        name: "Potassium",
                        unit: "mg",
                        amount: 425,
                        recommendIntake: 1500,
                        maxIntake: 3000,
                        isImportant: true
                    )
                ],
                keywords: ["Blood pressure regulation", "Immune system support"],
                cautions: "Generally safe but can raise blood sugar levels if consumed in excess. Eat in moderation.",
                amountOnce: "100g"
            ),
            Food(
                name: "Glutinous Rice",
                category: .grainsAndNuts,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Carbohydrates",
                        unit: "g",
                        amount: 77.2,
                        recommendIntake: 175,
                        maxIntake: 175,
                        isImportant: true
                    )
                ],
                keywords: ["Energy supply"],
                cautions: "High in gluten, which can be difficult to digest. Avoid overeating.",
                amountOnce: "100g"
            ),
            Food(
                name: "Beans",
                category: .grainsAndNuts,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 8.0,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Dietary Fiber",
                        unit: "g",
                        amount: 6.4,
                        recommendIntake: 50,
                        maxIntake: 50,
                        isImportant: true
                    ),
                    .init(
                        name: "Iron",
                        unit: "mg",
                        amount: 2.7,
                        recommendIntake: 24,
                        maxIntake: 45,
                        isImportant: true
                    )
                ],
                keywords: ["Fetal growth and development", "Anemia prevention"],
                cautions: "Beans are healthy, but excessive consumption can stimulate hormone production and cause uterine contractions, so consume in moderation.",
                amountOnce: "100g"
            ),
            Food(
                name: "Red Beans",
                category: .grainsAndNuts,
                evaluation: Evaluation(never: 0, rarely: 8, often: 36, usually: 24),
                nutrients: [
                    .init(
                        name: "Dietary Fiber",
                        unit: "g",
                        amount: 7.0,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Vitamin B1",
                        unit: "mg",
                        amount: 0.3,
                        recommendIntake: 2.6,
                        maxIntake: 2.6,
                        isImportant: true
                    )
                ],
                keywords: ["Constipation prevention", "Energy metabolism"],
                cautions: "Like beans, red beans can cause uterine contractions. Consume in moderation.",
                amountOnce: "100g"
            ),
            Food(
                name: "Hamburger",
                category: .grainsAndNuts,
                evaluation: Evaluation(never: 20, rarely: 18, often: 12, usually: 12),
                nutrients: [
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 12,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 16,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Sodium",
                        unit: "mg",
                        amount: 800,
                        recommendIntake: 1500,
                        maxIntake: 3000,
                        isImportant: true
                    )
                ],
                keywords: ["Protein supply"],
                cautions: "High in sodium, saturated fat, and trans fats, leading to hypertension, obesity, and digestive issues. Consume occasionally and pair with healthier foods.",
                amountOnce: "100g"
            ),
            Food(
                name: "Pizza",
                category: .grainsAndNuts,
                evaluation: Evaluation(never: 10, rarely: 28, often: 16, usually: 24),
                nutrients: [
                    .init(
                        name: "Carbohydrates",
                        unit: "g",
                        amount: 36.0,
                        recommendIntake: 175,
                        maxIntake: 175,
                        isImportant: true
                    ),
                    .init(
                        name: "Fat",
                        unit: "g",
                        amount: 12,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Sodium",
                        unit: "mg",
                        amount: 700,
                        recommendIntake: 1500,
                        maxIntake: 3000,
                        isImportant: true
                    )
                ],
                keywords: [],
                cautions: "Similar to hamburgers, pizzas are also high in sodium and fat. Consume in moderation for better health.",
                amountOnce: "100g"
            ),
            Food(
                name: "Instant Noodles",
                category: .grainsAndNuts,
                evaluation: Evaluation(never: 20, rarely: 18, often: 12, usually: 11),
                nutrients: [
                    .init(
                        name: "Carbohydrates",
                        unit: "g",
                        amount: 60,
                        recommendIntake: 175,
                        maxIntake: 175,
                        isImportant: true
                    ),
                    .init(
                        name: "Sodium",
                        unit: "mg",
                        amount: 1200,
                        recommendIntake: 1500,
                        maxIntake: 3000,
                        isImportant: true
                    )
                ],
                keywords: [],
                cautions: "High in sodium, which can cause hypertension and edema. It's better to avoid consuming.",
                amountOnce: "100g"
            ),
            Food(
                name: "Spicy Rice Cakes",
                category: .grainsAndNuts,
                evaluation: Evaluation(never: 20, rarely: 28, often: 21, usually: 13),
                nutrients: [
                    .init(
                        name: "Carbohydrates",
                        unit: "g",
                        amount: 35.0,
                        recommendIntake: 175,
                        maxIntake: 175,
                        isImportant: true
                    ),
                    .init(
                        name: "Protein",
                        unit: "g",
                        amount: 0.5,
                        recommendIntake: 70,
                        maxIntake: 70,
                        isImportant: true
                    ),
                    .init(
                        name: "Sodium",
                        unit: "mg",
                        amount: 800,
                        recommendIntake: 1500,
                        maxIntake: 3000,
                        isImportant: true
                    )
                ],
                keywords: [],
                cautions: "Spiciness can cause heartburn and indigestion. Avoid frequent consumption.",
                amountOnce: "100g"
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
