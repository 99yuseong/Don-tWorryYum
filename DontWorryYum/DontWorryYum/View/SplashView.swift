//
//  SplashView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Smart choice for mom")
                    .font(.pretendardSemibold16)
                Image("Title")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 46)
            }
            .padding(.top, 165)
            .padding(.leading, 40)
            
            Spacer()
            
            Image("splashIllust")
                .resizable()
                .scaledToFit()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
