//
//  main.swift
//  Day07
//
//  Created by Vladimir Svidersky on 12/10/22.
//

import Foundation

print("Hello, World!")

class Command {
    
    enum CommandType {
        case ls
        case cd
        case dir
        case file
    }
    
    var type: CommandType = .ls
    var args: String? = nil
    var argi: Int? = nil
    
    init(s: String) {
        let p = s.split(separator: " ")
        
        if p[0] == "$" {
            if p[1] == "ls" {
                type = .ls
            } else if p[1] == "cd" {
                type = .cd
                args = String(p[2])
            }
        } else if p[0] == "dir" {
            type = .dir
            args = String(p[1])
        } else {
            type = .file
            args = String(p[1])
            argi = Int(p[0])!
        }
    }
}

struct File {
    let name: String
    let size: Int
}

class Directory {
    let name: String
    var files: [File] = []
    var dirs: [Directory] = []

    init(name: String) {
        self.name = name
    }
    
    var size: Int {
        let dirSize = dirs.map({ $0.size }).reduce(0, +)
        let fileSize = files.map({ $0.size }).reduce(0, +)
        return dirSize + fileSize
    }
    
    func findDir(_ path: [String]) -> Directory? {
        var _path = path
        if _path[0] == name {
            _path.remove(at: 0)
        }
        
        if _path.count == 0 {
            return self
        }
        
        let dir = dirs.first(where: { $0.name == _path.first })
        _path.remove(at: 0)
        if _path.count == 0 {
            return dir
        }
        
        return dir?.findDir(_path)
    }
    
    func printDirSizes() {
        print("\(name) - \(size)")
        dirs.forEach({
            $0.printDirSizes()
        })
    }
    
    var allDirectories: [Directory] {
        var res: [Directory] = [self]
        dirs.forEach { dir in
            res.append(contentsOf: dir.allDirectories)
        }
        return res
    }
    
    var limitedSize: Int {
        var res = 0
        let limit = 100000
        
        if size < limit {
            res = res + size
        }
        
        res = res + dirs.map({ $0.limitedSize }).reduce(0, +)
        return res
    }
}

var path: [String] = []
var fs = Directory(name: "/")
var dir: Directory?

// Build the file system
data1.forEach { line in
    
    let cmd = Command(s: line)
    switch cmd.type {
    case .cd:
        if cmd.args! == ".." {
            path.removeLast()
        } else {
            path.append(cmd.args!)
        }
        dir = fs.findDir(path)
        
    case .ls:
        break
        
    case .dir:
        dir?.dirs.append(Directory(name: cmd.args!))
        
    case .file:
        dir?.files.append(File(name: cmd.args!, size: cmd.argi!))
    }
}

// Part 1
fs.printDirSizes()
print("Result \(fs.limitedSize)")


// Part 2
print("Current Size: \(fs.size)")
let available = 70000000 - fs.size
let needToFree = 30000000 - available
print("Need to free \(needToFree)")
let allDirs = fs.allDirectories.sorted(by: { $0.size < $1.size })
let first = allDirs.first(where: { $0.size > needToFree })
print("Need to delete \(first!.name) - \(first!.size)")

