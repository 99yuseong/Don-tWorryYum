//
//  NickNameView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import SwiftUI

struct NickNameView: View {
    @AppStorage("nickname") private var nickname: String = ""
    var isValid: Bool { !nickname.isEmpty }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Hello!")
                HStack {
                    Text("Let me know your")
                    Text("Nickname")
                        .foregroundStyle(.accent)
                }
            }
            .font(.pretendardBold24)
            .foregroundStyle(.usDarker)
            .padding(.top, 40)
            .padding(.bottom, 10)
            
            Text("Please set a nickname without spaces\n(maximum 10 characters)")
                .font(.pretendardMedium16)
                .foregroundStyle(.usNormal)
                .padding(.bottom, 30)
            
            TextField(text: $nickname) {
                Text("Nickname")
                    .font(.pretendardBold24)
                    .foregroundStyle(.usNormal)
            }
            .font(.pretendardBold24)
            .foregroundStyle(.accent)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .foregroundStyle(.usLightHover)
                    .frame(height: 56)
            )
            
            Spacer()
            
            Button {
                NavigationManager.shared.push(to: .week)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .frame(height: 56)
                        .foregroundStyle(isValid ? .accent : .usLight)
                    
                    Text("Next")
                        .font(.pretendardBold16)
                        .foregroundStyle(isValid ? .usDarker : .usNormal)
                }
            }
            .padding(.bottom, 16)
            .disabled(!isValid)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    NickNameView()
}
