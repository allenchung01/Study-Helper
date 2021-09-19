//
//  Time.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import Foundation

public class Time: NSObject {
    var hour: Int
    var minute: Int
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
}
