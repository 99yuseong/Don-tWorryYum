//
//  FoodView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/10/24.
//

import SwiftUI

struct FoodView: View {
    @State private var isNutrientShowing: Bool = false
    
    let food: Food
    let colors: [Color]
    
    init(food: Food) {
        self.food = food
        self.colors = (0..<food.nutrients.count)
                        .map { _ in Color.random }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Button {
                        NavigationManager.shared.pop()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 16)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Circle().frame(width: 8)
                            .foregroundStyle(food.evaluation.max.color)
                        
                        Text(food.name)
                            .font(.pretendardBold24)
                    }
                    
                    KeywordContainerView(items: food.keywords)
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 16)
                
                USDivider()
                    .padding(.bottom, 16)
                
                HStack {
                    
                    Text("Please Vote!")
                        .font(.pretendardBold14)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(.accent)
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Text("\(food.evaluation.total)")
                            .foregroundStyle(.accent)
                        
                        Text("Mom’s Pick")
                            .foregroundStyle(.usNormal)
                    }
                    .font(.pretendardMedium12)
                }
                
                EvaluationView(evaluation: food.evaluation)
                    .background(
                        RoundedCorner(radius: 8, corners: [.topRight, .bottomLeft, .bottomRight])
                            .stroke(.usLight, lineWidth: 1)
                    )
                    .padding(.bottom, 20)
                
                
                VStack(spacing: 16) {
                    HStack(spacing: 8) {
                        Text("Ingredient")
                            .foregroundStyle(.usDarker)
                            .font(.pretendardBold20)
                        
                        Text("\(food.amountOnce)")
                            .foregroundStyle(.usNormal)
                            .font(.pretendardMedium14)
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: isNutrientShowing ? "chevron.down" : "chevron.up")
                                .frame(width: 12)
                                .foregroundStyle(.usDarker)
                        }
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            isNutrientShowing.toggle()
                        }
                    }
                    
                    if isNutrientShowing {
                        ForEach(Array(food.nutrients.enumerated()), id: \.offset) { index, item in
                            NutrientBar(nutrient: item, color: colors[index])
                        }
                    }
                    
                    USDivider()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Be Careful!")
                            .font(.pretendardBold18)
                        
                        Text(food.cautions)
                            .font(.pretendardRegular14)
                    }
                    .foregroundStyle(.usDarkActive)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.usLight, lineWidth: 1)
                )
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden()
    }
}

extension FoodView {
    @ViewBuilder
    func USDivider() -> some View {
        DashedLine()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .frame(height: 1)
            .foregroundColor(.usLightActive)
    }
    
    @ViewBuilder
    func EvaluationView(evaluation: Evaluation) -> some View {
        HStack {
            VStack(spacing: 5) {
                Text("never")
                Image("fish")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                Text("\(evaluation.never.count)")
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Text("rarely")
                Image("fish")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                Text("\(evaluation.rarely.count)")
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Text("often")
                Image("fish")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                Text("\(evaluation.often.count)")
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Text("usually")
                Image("fish")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                Text("\(evaluation.usually.count)")
            }
        }
        .font(.pretendardMedium12)
        .foregroundStyle(.usNormal)
        .padding(.horizontal, 28)
        .padding(.vertical, 10)
    }
    
    @ViewBuilder
    func NutrientBar(nutrient: Nutrient, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Text(nutrient.name)
                    .font(.pretendardMedium14)
                Text("\(String(format: "%.\(2)f", nutrient.amount))\(nutrient.unit)")
                    .font(.pretendardBold14)
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.usLightActive)
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.usLightHover)
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(color)
            }
        }
    }

}

#Preview {
    FoodView(food: Food.mock().first!)
}
