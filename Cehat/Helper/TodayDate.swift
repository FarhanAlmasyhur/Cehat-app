//
//  TodayDate.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 22/06/22.
//

import Foundation

extension Date{
    
    static func getTodaysDate() -> String {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let result = formatter.string(from: date)
        return result
    }
}
