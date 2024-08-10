//
//  WeeksView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import SwiftUI

struct WeeksView: View {
    @AppStorage("date") private var selectedDate: Double = Date().timeIntervalSince1970
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 0) {
                    Text("How far along ")
                        .foregroundStyle(.accent)
                    Text("are you?")
                }
                
                HStack(spacing: 0) {
                    Text("and When is your ")
                    Text("due date?")
                        .foregroundStyle(.accent)
                }
            }
            .font(.pretendardBold24)
            .foregroundStyle(.usDarker)
            .padding(.top, 40)
            .padding(.bottom, 10)
            
            Text("‘momspick’ will teach you healthy and safe food with mothers to 00 and their children")
                .font(.pretendardMedium14)
                .foregroundStyle(.usNormal)
                .padding(.bottom, 30)
            
            DatePicker(
                selection: Binding(
                    get: { Date(timeIntervalSince1970: selectedDate) },
                    set: { selectedDate = $0.timeIntervalSince1970 }
                ),
                displayedComponents:  [.date]
            ) {
                Text("Due date")
                    .font(.pretendardMedium16)
                    .foregroundStyle(.usNormal)
            }
            .padding(.horizontal, 16)
            .datePickerStyle(WheelDatePickerStyle())
            
            Spacer()
            
            Button {
                NavigationManager.shared.popToRoot()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .frame(height: 56)
                        .foregroundStyle(.accent)
                    
                    Text("Next")
                        .font(.pretendardBold16)
                        .foregroundStyle(.usDarker)
                }
            }
            .padding(.bottom, 16)
        }
        .padding(.horizontal, 20)
    }
}
