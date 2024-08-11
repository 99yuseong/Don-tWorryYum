//
//  KeywordContainerView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import SwiftUI

public struct KeywordContainerView: View {
    @State var totalHeight: CGFloat
    let verticalSpacing: CGFloat
    let horizontalSpacing: CGFloat
    let items: [String]
    
    public init(
        totalHeight: CGFloat = .zero,
        verticalSpacing: CGFloat = 8,
        horizontalSpacing: CGFloat = 8,
        items: [String]
    ) {
        self.totalHeight = totalHeight
        self.verticalSpacing = verticalSpacing
        self.horizontalSpacing = horizontalSpacing
        self.items = items
    }
    
    public var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        GeometryReader { geomety in
            ZStack(alignment: .topLeading) {
                ForEach(self.items, id: \.self) { item in
                    Text(item)
                        .font(.pretendardBold14)
                        .foregroundStyle(.usDarker)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5.5)
                        .background(.usLight)
                        .clipShape(Capsule())
                        .alignmentGuide(.leading) { view in
                            if abs(width - view.width) > geomety.size.width {
                                width = 0
                                height -= view.height
                                height -= verticalSpacing
                            }
                            let result = width
                            
                            if item == items.last {
                                width = 0
                            } else {
                                width -= view.width
                                width -= horizontalSpacing
                            }
                            
                            return result
                        }
                        .alignmentGuide(.top) { _ in
                            let result = height
                            
                            if item == items.last {
                                height = 0
                            }
                            return result
                        }
                }
            }
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.totalHeight = geometry.size.height
                        }
                }
            )
        }
        .frame(height: totalHeight)
    }
}

#Preview {
    KeywordContainerView(items: ["asdfasdf", "asdvfasdf", "asdfaccsdf","asdfasdfasdfasdfasdfasdfasdfasdfa"])
}
