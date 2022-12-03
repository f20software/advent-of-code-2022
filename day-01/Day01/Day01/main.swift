//
//  main.swift
//  Day01
//
//  Created by Vladimir Svidersky on 12/2/22.
//

import Foundation

func insertMax(max: Int, maxes: [Int], limit: Int) -> [Int] {
    var result = maxes
    if let index = maxes.firstIndex(where: { $0 > max }) {
        result.insert(max, at: index)
    } else {
        result.append(max)
    }
    
    if result.count > limit {
        result.remove(at: 0)
    }
    
    return result
}

func findMaxIn(data: [Int], limit: Int) -> Int {

    var maxes: [Int] = [0]
    var curValue = 0
    
    data.forEach { a in
        if a < 0 {
            if maxes.count < limit ||
                curValue > maxes[0] {
                maxes = insertMax(max: curValue, maxes: maxes, limit: limit)
                print("current maxes are \(maxes)")
            }
            curValue = 0
        }
        else {
            curValue += a
        }
    }

    return maxes.reduce(0, +)
}

// Part 1
let result1 = findMaxIn(data: data1, limit: 1)
print("Result is \(result1)")

// Part 2
let result2 = findMaxIn(data: data1, limit: 3)
print("Result is \(result2)")

