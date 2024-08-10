//
//  ListView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import SwiftUI

struct ListView: View {
    let category: Category
    let foods: [Food] = Food.mock()
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button {
                    NavigationManager.shared.pop()
                } label: {
                    Image(systemName: "chevron.left")
                }
                
                Spacer()
                
                Text(category.description)
                    .font(.pretendardBold16)
                    .foregroundStyle(.usDarker)
                
                Spacer()
                
                Image(systemName: "")
                    .padding(.leading, 20)
            }
            .frame(height: 44)
            
            ForEach(foods) { food in
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
                    
                    Divider().foregroundStyle(.usLightHover)
                }
                .onTapGesture {
                    NavigationManager.shared.push(to: .food(food: food))
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ListView(category: .coffeeAndTea)
}
