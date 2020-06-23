//
//  DateManager.swift
//  MasqWithSwiftUI
//
//  Created by 温蟾圆 on 2020/6/18.
//  Copyright © 2020 温蟾圆. All rights reserved.
//

import Foundation

class DateManager {
    static func formatterDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY年MM月dd日 HH:mm"
        return dateFormatter.string(from: date)
    }
    
    static func formatterDate(date: Date, with dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
}
