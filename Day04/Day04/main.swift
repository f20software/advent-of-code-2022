//
//  main.swift
//  Day04
//
//  Created by Vladimir Svidersky on 12/4/22.
//

import Foundation

func parseLine(line: String) -> (s1: Int, e1: Int, s2: Int, e2: Int) {
    
    let pairs = line.split(separator: ",")
    let i1 = pairs[0].split(separator: "-")
    let i2 = pairs[1].split(separator: "-")
    
    let s1 = Int(i1[0])!
    let e1 = Int(i1[1])!
    let s2 = Int(i2[0])!
    let e2 = Int(i2[1])!
    
    return (s1, e1, s2, e2)
}

func isFullContained(s1: Int, e1: Int, s2: Int, e2: Int) -> Bool {
    return (s1 >= s2 && e1 <= e2) ||
     (s1 <= s2 && e1 >= e2)
}

func isOverlapped(s1: Int, e1: Int, s2: Int, e2: Int) -> Bool {
    return (s1 <= s2 && e1 >= s2) ||
     (s1 >= s2 && e2 >= s1)
}

func processData(data: [String]) -> Int {
    var result = 0
    data.forEach({ line in
        let (s1, e1, s2, e2) = parseLine(line: line)
        // Part 1
        if isFullContained(s1: s1, e1: e1, s2: s2, e2: e2) {
            result += 1
        // Part 2
        } else if isOverlapped(s1: s1, e1: e1, s2: s2, e2: e2) {
            result += 1
        }
    })
    
    return result
}
 

let res = processData(data: data1)
print("Result is \(res)")

