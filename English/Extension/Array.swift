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
