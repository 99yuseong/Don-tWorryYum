//
//  MainView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import SwiftUI

enum Selection {
    case never
    case rarely
    case often
    case usually
}

struct MainView: View {
    @AppStorage("nickname") private var nickname: String = "Jenny"
    @AppStorage("date") private var date: Double = Date().timeIntervalSince1970
    var week: Int { Date(timeIntervalSince1970: date).toWeek() }
    @State private var text: String = ""
    @State private var selection: Selection? = nil
    
    var body: some View {
        ZStack {
            Color.usLight
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(nickname)
                            .font(.pretendardSemibold24)
                            .foregroundStyle(.usDarker)
                        
                        HStack(spacing: 4) {
                            Text("Week \(week)")
                        }
                        .font(.pretendardBold16)
                        .foregroundStyle(.accent)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .clipShape(Capsule())
                        
                        Spacer()
                    }
                    
                    Image("main")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 240)
                    
                    
                    HStack(spacing: 0) {
                        Text("Nutrients that are essential for mothers at ")
                            .font(.pretendardMedium14)
                            .foregroundStyle(.usNormal)
                        Text("Week \(week)")
                            .font(.pretendardBold14)
                            .foregroundStyle(.accent)
                    }
                    .padding(.bottom, 12)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(Data.recommendNutrients, id: \.hashValue) { nutrient in
                                NutrientView(
                                    name: nutrient.first ?? "",
                                    amount: nutrient.last ?? ""
                                )
                            }
                        }
                    }
                    .frame(height: 75)
                    .scrollIndicators(.hidden, axes: .horizontal)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading) {
                        Text("What food did")
                        Text("the mothers choose?")
                    }
                        .font(.pretendardBold20)
                        .foregroundStyle(.usDarker)
                        .padding(.bottom, 12)
                        .padding(.top, 20)
                    
                    SearchBar(text: $text)
                        .padding(.bottom, 34)
                        .disabled(true)
                        .onTapGesture {
                            NavigationManager.shared.push(to: .search)
                        }
                    
                    Text("Tell me your opinion!")
                        .font(.pretendardMedium14)
                        .foregroundStyle(.usNormal)
                        .padding(.bottom, 6)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 0) {
                            Text("Can we drink ")
                            Text("coffee")
                                .font(.pretendardBold14)
                                .foregroundStyle(.accent)
                            Text("?")
                        }
                        .font(.pretendardMedium14)
                        .foregroundStyle(.usNormal)
                        .padding(.top, 12)
                        .padding(.leading, 14)
                        
                        EvaluationView(evaluation: Data.mainEvaluation)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.white)
                            )
                            .padding(4)
                    }
                    .background(selection != nil ? .usGreen : .usLightHover)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .background(.white)
            }
        }
    }
}

extension MainView {
    @ViewBuilder
    func EvaluationView(evaluation: Evaluation) -> some View {
        HStack {
            VStack(spacing: 5) {
                Text("never")
                Image("never")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text("\(evaluation.never.count + (selection == .never ? 1 : 0))")
            }
            .font(selection == .never ? .pretendardBold12 : .pretendardMedium12)
            .foregroundStyle(selection == .never ? .accent : .usNormal)
            .frame(width: 64, height: 98)
            .background(selection == .never ? .usPink.opacity(0.1) : .white)
            .onTapGesture {
                selection = .never
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Text("rarely")
                Image("rarely")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text("\(evaluation.rarely.count + (selection == .rarely ? 1 : 0))")
            }
            .font(selection == .rarely ? .pretendardBold12 : .pretendardMedium12)
            .foregroundStyle(selection == .rarely ? .accent : .usNormal)
            .frame(width: 64, height: 98)
            .background(selection == .rarely ? .usPink.opacity(0.1) : .white)
            .onTapGesture {
                selection = .rarely
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Text("often")
                Image("often")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text("\(evaluation.often.count + (selection == .often ? 1 : 0))")
            }
            .font(selection == .often ? .pretendardBold12 : .pretendardMedium12)
            .foregroundStyle(selection == .often ? .accent : .usNormal)
            .frame(width: 64, height: 98)
            .background(selection == .often ? .usPink.opacity(0.1) : .white)
            .onTapGesture {
                selection = .often
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Text("usually")
                Image("usually")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text("\(evaluation.usually.count + (selection == .usually ? 1 : 0))")
            }
            .font(selection == .usually ? .pretendardBold12 : .pretendardMedium12)
            .foregroundStyle(selection == .usually ? .accent : .usNormal)
            .frame(width: 64, height: 98)
            .background(selection == .usually ? .usPink.opacity(0.1) : .white)
            .onTapGesture {
                selection = .usually
            }
        }
        .padding(.horizontal, 28)
    }
    
    @ViewBuilder
    func NutrientView(name: String, amount: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name)
                .font(.pretendardBold16)
                .foregroundStyle(.usDarker)
            
            Text(amount)
                .font(.pretendardBold12)
                .foregroundStyle(.accent)
                .padding(.vertical, 3)
                .padding(.horizontal, 8)
                .background(.usLight)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .padding(14)
        .frame(minWidth: 100)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    @ViewBuilder
    func SearchBar(
        text: Binding<String>
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
        }
    }
}

#Preview {
    MainView()
}
