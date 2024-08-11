//
//  Date+.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import Foundation

extension Date {
    func toWeek() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        
        // 출산 예정일과 현재 날짜 사이의 차이를 계산
        let components = calendar.dateComponents([.day], from: currentDate, to: self)
        
        guard let daysUntilDueDate = components.day else {
            return 0
        }
        
        // 임신 주차를 계산 (임신은 일반적으로 40주)
        let weeksUntilDueDate = Double(daysUntilDueDate) / 7.0
        let pregnancyWeek = 40 - Int(weeksUntilDueDate.rounded(.down))
        
        return pregnancyWeek
    }
}
