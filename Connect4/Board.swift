//
//  Board.swift
//  Connect4
//
//  Created by Jonathon Day on 1/4/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation

class Board {
    var places: [[Disc]]
//           0 1 2 3 4 5 6
//    array[[5[5[5[5[5[5[5
//           4 4 4 4 4 4 4
//           3 3 3 3 3 3 3
//           2 2 2 2 2 2 2
//           1 1 1 1 1 1 1
//           ] ] ] ] ] ] ]
    var currentDisc = Disc.red
    
    enum Disc {
        case red, yellow, none
    }

    func dropDisc(column: Int) {
        //guard against numbers outside index range
        if let index = places[column].index(where: { $0 == Disc.none }) {
            places[column][index] = currentDisc
            switch currentDisc {
            case .red:
                currentDisc = .yellow
            case .yellow:
                currentDisc = .red
            case .none:
                fatalError()
            }
        }
    }
    
    var winner: Disc {
        
        for d in [Disc.yellow, Disc.red] {
            var columnRowForDisc = [(Int, Int)]()
            var columnIndex = 0
            
            for i in places {
                var rowIndex = 0
                for j in i where j == d {
                    columnRowForDisc.append((columnIndex, rowIndex))
                    rowIndex += 1
                }
                columnIndex += 1
            }
            
            let columnsSet = NSCountedSet(array: columnRowForDisc.map { $0.0 })
            let rowsSet = NSCountedSet(array: columnRowForDisc.map { $0.1 })
            
            let patternRowCounts = rowsSet.map { rowsSet.count(for: $0) }
            let patternColumnCounts = columnsSet.map { columnsSet.count(for: $0) }
            if let patternRowCountBest = patternRowCounts.max() {
                if patternRowCountBest >= 4 {
                    let test = d
                    return d
                }
            }
            
            if let patternColumnCountBest = patternColumnCounts.max() {
                if patternColumnCountBest >= 4 {
                    return d
                }
            }
        }
        return Disc.none
    }
    
    
    //returns the index of available columns
    var availableColumns: [Int] {
        var answerColumnIndicies = [Int]()
        var index = 0
        
        for i in places {
            let noneCount = i.reduce(0) {
                if $1 == Disc.none {
                    return $0 + 1
                } else {
                    return $0
                }
            }
            if noneCount > 0 {
                answerColumnIndicies.append(index)
            }
            index += 1
        }
        return answerColumnIndicies
    }
    
    init() {
        places = Array(repeating: Array(repeatElement(Disc.none, count: 6)), count: 7)
    }


}
