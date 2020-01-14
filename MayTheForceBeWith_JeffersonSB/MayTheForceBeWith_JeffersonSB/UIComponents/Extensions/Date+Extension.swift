//
//  Date+Extension.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

extension Date {
    static func getFormattedDate(string: String) -> String{
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
         dateFormatter.locale = Locale(identifier: "PT")
         let convertedDate = dateFormatter.date(from: string)

         guard let dateFormatted = convertedDate, dateFormatter.date(from: string) != nil else {
             assert(false, "no date from string")
             return ""
         }
        dateFormatter.dateFormat = "d MMM yyyy,  h:mm a"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: dateFormatted)
        return timeStamp
    }
}
