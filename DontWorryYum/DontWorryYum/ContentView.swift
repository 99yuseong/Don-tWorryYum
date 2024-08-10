//
//  ContentView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/10/24.
//

import SwiftUI
import GoogleGenerativeAI

struct ContentView: View {
    @State private var text: String = "..."
    
    let food = "추어탕"
    let keyword = "과도한 나트륨"
    let prompt = """
        "음식이 임산부가 먹기 적합한 음식인지 요약해서 간략하게 텍스트로 설명해줘.
        영양성분은 나중에 데이터로 뽑아 쓸 수 있도록 JSON 형식으로 돌려줬으면 좋겠어.
        다음의 항목을 수치화한 값으로 포함했으면 좋겠어. 
        (칼로리, kcal), (탄수화물, g), (단백질, g), (지방, g), (콜레스테롤, mg), (나트륨, mg), (칼슘, mg), (마그네슘, mg), (철분, mg), (비타민 A), (비타민 D, µg), (엽산, µg DFE), (비타민 B6, mg)
        """

    let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: APIKey.default)

    var body: some View {
        Text(text)
        
        Button("go") {
            Task {
                let response = try await model.generateContent(food + prompt)
                if let text = response.text {
                    print(text)
                    self.text = text
                } else {
                    print(text)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
