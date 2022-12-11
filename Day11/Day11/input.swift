//
//  input.swift
//  Day11
//
//  Created by Vladimir Svidersky on 12/11/22.
//

import Foundation

var data0: [Monkey] = [

    Monkey(oper: .mult, arg: 19, testBy: 23,
           indexTrue: 2, indexFalse: 3, items: [79, 98]),

    Monkey(oper: .add, arg: 6, testBy: 19,
           indexTrue: 2, indexFalse: 0, items: [54, 65, 75, 74]),

    Monkey(oper: .square, arg: 0, testBy: 13,
           indexTrue: 1, indexFalse: 3, items: [79, 60, 97]),

    Monkey(oper: .add, arg: 3, testBy: 17,
           indexTrue: 0, indexFalse: 1, items: [74]),
]

var data1: [Monkey] = [

    Monkey(oper: .mult, arg: 13, testBy: 3,
           indexTrue: 2, indexFalse: 1, items: [54, 98, 50, 94, 69, 62, 53, 85]),

    Monkey(oper: .add, arg: 2, testBy: 13,
           indexTrue: 7, indexFalse: 2, items: [71, 55, 82]),

    Monkey(oper: .add, arg: 8, testBy: 19,
           indexTrue: 4, indexFalse: 7, items: [77, 73, 86, 72, 87]),

    Monkey(oper: .add, arg: 1, testBy: 17,
           indexTrue: 6, indexFalse: 5, items: [97, 91]),

    Monkey(oper: .mult, arg: 17, testBy: 5,
           indexTrue: 6, indexFalse: 3, items: [78, 97, 51, 85, 66, 63, 62]),

    Monkey(oper: .add, arg: 3, testBy: 7,
           indexTrue: 1, indexFalse: 0, items: [88]),

    Monkey(oper: .square, arg: 0, testBy: 11,
           indexTrue: 5, indexFalse: 0, items: [87, 57, 63, 86, 87, 53]),

    Monkey(oper: .add, arg: 6, testBy: 2,
           indexTrue: 4, indexFalse: 3, items: [73, 59, 82, 65]),
]
