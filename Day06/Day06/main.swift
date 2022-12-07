//
//  main.swift
//  Day06
//
//  Created by Vladimir Svidersky on 12/6/22.
//

import Foundation

func isNoRepeated(s: String) -> Bool {
    var s1 = s
    while s1.count > 1 {
        let c = s1.prefix(1).first!
        s1 = String(s1.suffix(from: s1.index(s1.startIndex, offsetBy: 1)))
        let ind = s1.firstIndex(of: c)
        if ind != nil {
            return false
        }
    }
    
    return true
}

func processLine(s: String, len: Int) -> Int {
    var start = len
    var index = s.index(s.startIndex, offsetBy: start)
    
    while index <= s.endIndex {
        let slice = s[s.index(index, offsetBy: -len)..<index]
        if isNoRepeated(s: String(slice)) {
            return start
        }
        
        start += 1
        index = s.index(s.startIndex, offsetBy: start)
    }
    
    return -1
}

// Test
print("Result is \(processLine(s: data0[0], len: 4))")
print("Result is \(processLine(s: data0[1], len: 4))")
print("Result is \(processLine(s: data0[2], len: 4))")
// Part 1
print("Result is \(processLine(s: data1[0], len: 4))")
// Part 2
print("Result is \(processLine(s: data1[0], len: 14))")
