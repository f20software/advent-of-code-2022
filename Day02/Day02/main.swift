//
//  main.swift
//  Day02
//
//  Created by Vladimir Svidersky on 12/2/22.
//

import Foundation

func score_part1(opp: String, you: String) -> Int {
    var draw = false
    var win = false
    var value = 0
    
    switch you {
    case "X":
        draw = (opp == "A")
        win = (opp == "C")
        value = 1
    case "Y":
        draw = (opp == "B")
        win = (opp == "A")
        value = 2
    case "Z":
        draw = (opp == "C")
        win = (opp == "B")
        value = 3
    default:
        break
    }
    
    return value + (win ? 6 : 0) + (draw ? 3 : 0)
}

let toWin = [
    "A": 2,
    "B": 3,
    "C": 1
]

let toLose = [
    "A": 3,
    "B": 1,
    "C": 2,
]

let toDraw = [
    "A": 1,
    "B": 2,
    "C": 3
]

func score_part2(opp: String, res: String) -> Int {
    switch res {
    case "X":
        return toLose[opp]!

    case "Y":
        return toDraw[opp]! + 3
        
    case "Z":
        return toWin[opp]! + 6
        
    default:
        break
    }
    
    return 0
}

func processInput(data: [[String]]) -> Int {
    return data.reduce(0) { partialResult, pair in
        // return (partialResult + score_part1(opp: pair[0], you: pair[1]))
        return (partialResult + score_part2(opp: pair[0], res: pair[1]))
    }
}

// Part 1&2
let p1 = processInput(data: data1)
print("Result is \(p1)")

