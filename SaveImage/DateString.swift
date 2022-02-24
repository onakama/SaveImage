//
//  DateString.swift
//  SaveImage
//
//  Created by 住山大誠 on 2022/02/24.
//

import Foundation


class DateString {
    func get() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        let str = dateFormatter.string(from: Date())
        print(str)
        return str
    }
}
