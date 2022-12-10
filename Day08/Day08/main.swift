//
//  main.swift
//  Day08
//
//  Created by Vladimir Svidersky on 12/9/22.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

extension Character {
    var intValue: Int {
       return Int(String(self))!
    }
}

func isVisible(data: [String], x: Int, y: Int) -> Bool {

    let value = data[y][x].intValue
    
    // Go left
    var visible = true
    for i in 0..<x {
        if data[y][i].intValue >= value {
            visible = false
            break
        }
    }
    if visible {
        return true
    }
    
    // Go right
    visible = true
    for i in x+1..<data[y].count {
        if data[y][i].intValue >= value {
            visible = false
            break
        }
    }
    if visible {
        return true
    }

    // Go up
    visible = true
    for i in 0..<y {
        if data[i][x].intValue >= value {
            visible = false
            break
        }
    }
    if visible {
        return true
    }

    // Go down
    visible = true
    for i in y+1..<data.count {
        if data[i][x].intValue >= value {
            visible = false
            break
        }
    }
    
    return visible
}

func scenicScore(data: [String], x: Int, y: Int) -> Int {

    let value = data[y][x].intValue
    var score = 1
    
    // Go left
    var visible = 0
    for i in (0..<x).reversed() {
        if data[y][i].intValue <= value {
            visible += 1
        }
        if data[y][i].intValue >= value {
            break
        }
    }
    score = score * visible
    
    // Go right
    visible = 0
    for i in x+1..<data[y].count {
        if data[y][i].intValue <= value {
            visible += 1
        }
        if data[y][i].intValue >= value {
            break
        }
    }
    score = score * visible

    // Go up
    visible = 0
    for i in (0..<y).reversed() {
        if data[i][x].intValue <= value {
            visible += 1
        }
        if data[i][x].intValue >= value {
            break
        }
    }
    score = score * visible

    // Go down
    visible = 0
    for i in y+1..<data.count {
        if data[i][x].intValue <= value {
            visible += 1
        }
        if data[i][x].intValue >= value {
            break
        }
    }
    score = score * visible

    return score
}

func processData_Part1(data: [String]) -> Int {
    
    var visible = data.count * 2 + data[0].count * 2 - 4
    for i in 1..<data.count-1 {
        for j in 1..<data[0].count-1 {
            if isVisible(data: data, x: j, y: i) {
                visible += 1
            }
        }
    }
    
    return visible
}

func processData_Part2(data: [String]) -> Int {
    
    var max = 0
    for i in 1..<data.count-1 {
        for j in 1..<data[0].count-1 {
            let score = scenicScore(data: data, x: j, y: i)
            if score > max {
                max = score
            }
        }
    }
    
    return max
}

// Part 1
print("Result is \(processData_Part1(data: data1))")

// Part 2
print("Result is \(processData_Part2(data: data1))")

