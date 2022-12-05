//
//  main.swift
//  Day05
//
//  Created by Vladimir Svidersky on 12/5/22.
//

import Foundation

// move 1 from 2 to 1
func parseMove(line: String) -> (qty: Int, from: Int, to: Int) {
    let el = line.split(separator: " ")
    let qty = Int(el[1])!
    let from = Int(el[3])!-1
    let to = Int(el[5])!-1
    return (qty: qty, from: from, to: to)
}

func doMove_Part1(stack: [String], qty: Int, from: Int, to: Int) -> [String] {
    var result = stack
    
    for _ in 1...qty {
        let originalLen = result[from].count
        let take = result[from].suffix(1)
        result[from] = String(result[from].prefix(originalLen-1))
        result[to] = result[to].appending(take)
    }
    
    return result
}

func doMove_Part2(stack: [String], qty: Int, from: Int, to: Int) -> [String] {
    var result = stack
    
    let originalLen = result[from].count
    let take = result[from].suffix(qty)
    result[from] = String(result[from].prefix(originalLen-qty))
    result[to] = result[to].appending(take)
    
    return result
}

func doPart1(stack: [String], moves: [String]) -> String {
    var res = stack
    moves.forEach { line in
        let move = parseMove(line: line)
        res = doMove_Part1(stack: res, qty: move.qty, from: move.from, to: move.to)
    }
    
    return res.map({ String($0.last!) }).joined()
}

func doPart2(stack: [String], moves: [String]) -> String {
    var res = stack
    moves.forEach { line in
        let move = parseMove(line: line)
        res = doMove_Part2(stack: res, qty: move.qty, from: move.from, to: move.to)
    }
    
    return res.map({ String($0.last!) }).joined()
}


let res1 = doPart1(stack: stacks02, moves: moves02)
print("Result is \(res1)")

let res2 = doPart2(stack: stacks02, moves: moves02)
print("Result is \(res2)")
