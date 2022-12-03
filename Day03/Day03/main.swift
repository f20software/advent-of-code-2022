//
//  main.swift
//  Day03
//
//  Created by Vladimir Svidersky on 12/3/22.
//

import Foundation

func priority(c: Character) -> Int {
    let lowerA = "a".first!.asciiValue!
    let upperA = "A".first!.asciiValue!

    if c.isLowercase {
        return (Int(c.asciiValue! - lowerA) + 1)
    } else {
        return (Int(c.asciiValue! - upperA) + 27)
    }
}

func findDuplicates_Part1(s1: String, s2: String) -> Int {
    var foundDups = ""
    var result = 0
    
    s1.forEach { c in
        if foundDups.contains(c) {
            return
        }
        
        if s2.contains(c) {
            result += priority(c: c)
            foundDups.append(c)
        }
    }
    
    return result
}

func findDuplicates_Part2(s1: String, s2: String, s3: String) -> Int {
    var foundDups = ""
    var result = 0
    
    s1.forEach { c in
        if foundDups.contains(c) {
            return
        }

        if s2.contains(c) && s3.contains(c) {
            result += priority(c: c)
            foundDups.append(c)
        }
    }
    
    return result
}


func processData_Part1(data: [String]) -> Int {
    var result = 0
    
    data.forEach { str in
        let half = str.count / 2
        let s1 = str.prefix(half)
        let s2 = str.suffix(half)
        result += findDuplicates_Part1(s1: String(s1), s2: String(s2))
    }
    
    return result
}

func processData_Part2(data: [String]) -> Int {
    var index = 0
    var result = 0
    
    while index < data.count {
        result += findDuplicates_Part2(s1: data[index], s2: data[index+1], s3: data[index+2])
        index += 3
    }
    
    return result
}

// Part 1
let res1 = processData_Part1(data: data1)
print("Result is \(res1)")

// Part 2
let res2 = processData_Part2(data: data1)
print("Result is \(res2)")


