//
//  Collection+Exstension.swift
//  MVC_Testwork
//
//  Created by Константин Евсюков on 20.03.2024.
//

import UIKit

extension Collection {

    subscript(safe index: Index) -> Element? {
        return safeObject(at: index)
    }

    func safeObject(at index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

