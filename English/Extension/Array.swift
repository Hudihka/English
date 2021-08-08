//
//  Array.swift
//  English
//
//  Created by Hudihka on 04/08/2021.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
//telephoneArray[safe: indexPath.row - 1]

extension Array { //массив уже должен быть без искомого слова, но только если слов меньше 10
	subscript (obj: Element) -> [Element] {
        var copy = self
		var n = 10
		if self.count < n {
			n = self.count
		}

        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }

		let randomIndex = Int(arc4random_uniform(UInt32(n)))
		copy[randomIndex] = obj

        return Array(copy.suffix(n))
    }
}