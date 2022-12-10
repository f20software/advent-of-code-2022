//
//  main.swift
//  Day09
//
//  Created by Vladimir Svidersky on 12/10/22.
//

import Foundation

class Command {
    
    enum Direction {
        case up
        case down
        case right
        case left
    }
    
    let d: Direction
    let v: Int
    
    init(str: String) {
        let pair = str.split(separator: " ")
        switch pair[0] {
        case "R": d = .right
        case "L": d = .left
        case "U": d = .up
        default:
            d = .down
        }
        v = Int(pair[1])!
    }
}

class Point {
    
    var x: Int
    var y: Int
    
    var descr: String {
        return "(\(x), \(y))"
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func move(cmd: Command) {
        switch cmd.d {
        case .up: y = y + 1
        case .down: y = y - 1
        case .left: x = x - 1
        case .right: x = x + 1
        }
    }
    
    func moveCloser(to: Point) {
        if to.x > (x+1) {
            x = x + 1
            if to.y > y {
                y = y + 1
            } else if to.y < y {
                y = y - 1
            }
        } else if to.x < (x-1) {
            x = x - 1
            if to.y > y {
                y = y + 1
            } else if to.y < y {
                y = y - 1
            }
        } else {
            if to.y > (y+1) {
                y = y + 1
                if to.x < x {
                    x = x - 1
                } else if to.x > x {
                    x = x + 1
                }
            } else if to.y < (y-1) {
                y = y - 1
                if to.x < x {
                    x = x - 1
                } else if to.x > x {
                    x = x + 1
                }
            }
        }
    }
}

var head = Point(x: 0, y: 0)
var tails = [
    Point(x: 0, y: 0),
    // Uncomment 8 more tail points for the Part 2
//    Point(x: 0, y: 0),
//    Point(x: 0, y: 0),
//    Point(x: 0, y: 0),
//    Point(x: 0, y: 0),
//    Point(x: 0, y: 0),
//    Point(x: 0, y: 0),
//    Point(x: 0, y: 0),
//    Point(x: 0, y: 0),
]
    

var visited: [Point] = []

// Part 1 & 2
data1.forEach { line in
    let cmd = Command(str: line)
    for _ in 0..<cmd.v {
        head.move(cmd: cmd)
        tails.first!.moveCloser(to: head)
        for i in 1..<tails.count {
            tails[i].moveCloser(to: tails[i-1])
        }
        
        let tail = tails.last!
        print("H:\(head.descr), T:\(tail.descr)")
        
        if visited.first(where: { $0.x == tail.x && $0.y == tail.y }) == nil {
            visited.append(Point(x: tail.x, y: tail.y))
        }
    }
}

print("\(visited.count)")
