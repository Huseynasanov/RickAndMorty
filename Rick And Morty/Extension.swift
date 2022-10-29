//
//  Extension.swift
//  Rick And Morty
//
//  Created by Huseyn Hasanov on 29.10.22.
//

import Foundation
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
