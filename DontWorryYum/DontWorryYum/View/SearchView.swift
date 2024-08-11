//
//  SearchView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/10/24.
//

import SwiftUI

struct SearchView: View {
    @State private var text: String = ""
    
    var filteredFoods: [Food] {
        if text.isEmpty {
            return Food.mock()
        } else {
            return Food.mock().filter { $0.name.contains(text) }
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            SearchBar(
                text: $text,
                cancel: {
                    NavigationManager.shared.pop()
                }
            )
            
            ScrollView {
                if text.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Recommended")
                            .foregroundStyle(.usNormal)
                            .font(.pretendardMedium14)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 12) {
                                TagView(food: Food.mock().filter { $0.name.contains("Cheese") }.first!)
                                TagView(food: Food.mock().filter { $0.name.contains("Salmon") }.first!)
                                Spacer()
                            }
                            
                            HStack(spacing: 12) {
                                TagView(food: Food.mock().filter { $0.name.contains("Red Beans") }.first!)
                                TagView(food: Food.mock().filter { $0.name.contains("Milk") }.first!)
                                Spacer()
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .leading) {
                        Text("Use the category to find it easily")
                            .foregroundStyle(.usNormal)
                            .font(.pretendardMedium14)
                        
                        VStack(spacing: 12) {
                            HStack(spacing: 12) {
                                CategoryView(image: "meategg", text: "Meat ∙ Eggs")
                                    .onTapGesture {
                                        NavigationManager.shared.push(to: .list(category: .meatAndEggs))
                                    }
                                CategoryView(image: "fish", text: "Sea Food ∙ Dried Food")
                                    .onTapGesture {
                                        NavigationManager.shared.push(to: .list(category: .seaFoodAndDried))
                                    }
                            }
                            HStack(spacing: 12) {
                                CategoryView(image: "veggie", text: "Natural food")
                                    .onTapGesture {
                                        NavigationManager.shared.push(to: .list(category: .veggieAndFruits))
                                    }
                                CategoryView(image: "process", text: "Processed food")
                                    .onTapGesture {
                                        NavigationManager.shared.push(to: .list(category: .grainsAndNuts))
                                    }
                            }
                            HStack(spacing: 12) {
                                CategoryView(image: "milk", text: "Dairy Products")
                                    .onTapGesture {
                                        NavigationManager.shared.push(to: .list(category: .dairyProducts))
                                    }
                                CategoryView(image: "coffeeandtea", text: "Coffee ∙ Tea")
                                    .onTapGesture {
                                        NavigationManager.shared.push(to: .list(category: .coffeeAndTea))
                                    }
                            }
                        }
                    }
                } else {
                    ForEach(filteredFoods) { food in
                        VStack(spacing: 0) {
                            HStack(alignment: .top, spacing: 8) {
                                Circle()
                                    .foregroundStyle(food.evaluation.max.color)
                                    .frame(width: 8)
                                    .padding(.top, 5)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(food.name)
                                        .font(.pretendardMedium16)
                                        .foregroundStyle(.usDarker)
                                    
                                    Text(food.amountOnce)
                                        .font(.pretendardMedium14)
                                        .foregroundStyle(.usNormal)
                                }
                                
                                Spacer()
                            }
                            .padding(.vertical, 12)
                            .background(.BG)
                            
                            Divider().foregroundStyle(.usLightHover)
                        }
                        .onTapGesture {
                            NavigationManager.shared.push(to: .food(food: food))
                        }
                    }
                }
                
                Spacer()
            }
            .scrollIndicators(.hidden)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
    }
}

extension SearchView {
    @ViewBuilder
    func SearchBar(
        text: Binding<String>,
        cancel: @escaping () -> Void
    ) -> some View {
        HStack(spacing: 12) {
            ZStack {
                TextField(text: text) {
                    Text("Find the food you want")
                        .font(.pretendardMedium16)
                        .foregroundStyle(.usNormal)
                }
                    .frame(height: 48)
                    .padding(.leading, 44)
                    .background(Color.usLightHover)
                    .cornerRadius(6)
                
                HStack {
                    Image("search")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.leading, 16)
                    Spacer()
                }
            }
            
            Button {
                cancel()
            } label: {
                Text("Cancel")
                    .font(.pretendardMedium16)
                    .foregroundStyle(.usDarker)
            }
        }
    }
    
    @ViewBuilder
    func TagView(food: Food) -> some View {
        Text(food.name)
            .foregroundStyle(.usNormal)
            .font(.pretendardMedium16)
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.usLightHover)
            )
            .onTapGesture {
                NavigationManager.shared.push(to: .food(food: food))
            }
    }
    
    @ViewBuilder
    func CategoryView(
        image: String,
        text: String
    ) -> some View {
        HStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.usLight)
                    .frame(width: 44, height: 44)
                
                Image(image)
                    .resizable()
                    .frame(width: 44, height: 44)
            }
            .padding(.trailing, 10)
            
            Text(text)
                .foregroundStyle(.usDarker)
                .font(.pretendardMedium14)
            
            Spacer()
        }
        .padding(12)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundStyle(.usLight)
        }
    }
}

#Preview {
    SearchView()
}
