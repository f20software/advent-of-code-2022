//
//  main.swift
//  Day11
//
//  Created by Vladimir Svidersky on 12/11/22.
//

import Foundation



class Monkey {
    
    enum Operation {
        case mult
        case add
        case square
    }
    
    let oper: Operation
    let arg: Int
    let testBy: Int
    let indexTrue: Int
    let indexFalse: Int

    var items: [Int]
    var counter: Int = 0

    init(oper: Operation, arg: Int, testBy: Int, indexTrue: Int, indexFalse: Int, items: [Int]) {
        self.oper = oper
        self.arg = arg
        self.testBy = testBy
        self.indexTrue = indexTrue
        self.indexFalse = indexFalse
        self.items = items
    }
    
    func doOne() -> (index: Int, value: Int)? {
        if items.isEmpty {
            return nil
        }
        
        counter += 1
        
        let value = items.first!
        var new = value
        
        items.remove(at: 0)
        
        switch oper {
        case .square:
            new = value * value
        case .add:
            new = value + arg
        case .mult:
            new = value * arg
        }
        
        new = new % 100000
        
        if (new % testBy == 0) {
            return (index: indexTrue, value: new)
        } else {
            return (index: indexFalse, value: new)
        }
    }
    
    func addOne(value: Int) {
        items.append(value)
    }
    
    func descr() {
        print("\(counter) - \(items)")
    }
}

func doRound(ms: [Monkey]) {
    ms.forEach { m in
        while let ret = m.doOne() {
            ms[ret.index].addOne(value: ret.value)
        }
    }

    ms.forEach { m in
        m.descr()
    }
}

for _ in 0..<10000 {
    print("----")
    doRound(ms: data0)
}

