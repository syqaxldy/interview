//
//  GetTime.swift
//  Test-Time
//
//  Created by syqaxldy on 2022/6/27.
//

import UIKit

public class GetTime: NSObject {
     
    public static let shared = GetTime()
    private override init() { }
    
     func getTimeStr(time: Int) -> String {
        if time < 12 && time > 6 {
            return "早上好"
        } else if time < 18 && time > 12 {
            return "下午好"
        }else {
            return "晚上好"
        }
    }
}
