//
//  main.swift
//  Day10
//
//  Created by Vladimir Svidersky on 12/10/22.
//

import Foundation

class Command {
    
    enum CommandType {
        case addx
        case noop
    }
    
    let type: CommandType
    let value: Int
    let start: Int
    let end: Int
    
    init(str: String, start: Int) {
        let pair = str.split(separator: " ")
        self.start = start

        if pair[0] == "addx" {
            type = .addx
            value = Int(pair[1])!
            end = start + 2
        } else {
            type = .noop
            value = 0
            end = start + 1
        }
    }
}

func parse(data: [String]) -> [Command] {
    var start = 1
    var comms: [Command] = []
    
    data.forEach { line in
        let cmd = Command(str: line, start: start)
        comms.append(cmd)
        start = cmd.end
    }
    
    return comms
}

func sumBefore(cs: [Command], before: Int) -> Int {
    return cs.filter({ $0.end <= before }).reduce(0, { (result, cmd) -> Int in
        result + cmd.value
    }) + 1
}

// Part 1
let cs = parse(data: data1)
let p1 = sumBefore(cs: cs, before: 20) * 20 +
    sumBefore(cs: cs, before: 60) * 60 +
    sumBefore(cs: cs, before: 100) * 100 +
    sumBefore(cs: cs, before: 140) * 140 +
    sumBefore(cs: cs, before: 180) * 180 +
    sumBefore(cs: cs, before: 220) * 220
 
print("Result is \(p1)")

// Part 2
func generateLine(cs: [Command], start: Int, len: Int) -> String {
    var ret = ""
    for i in 1...len {
        let value = sumBefore(cs: cs, before: i+start)
        if value >= i-2 && value <= i {
            ret = ret + "#"
        } else {
            ret = ret + "."
        }
    }
    
    return ret
}

print("\(generateLine(cs: cs, start: 0, len: 40))")
print("\(generateLine(cs: cs, start: 40, len: 40))")
print("\(generateLine(cs: cs, start: 80, len: 40))")
print("\(generateLine(cs: cs, start: 120, len: 40))")
print("\(generateLine(cs: cs, start: 160, len: 40))")
print("\(generateLine(cs: cs, start: 200, len: 40))")
