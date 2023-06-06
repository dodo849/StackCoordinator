//
//  File.swift
//  
//
//  Created by DOYEON LEE on 2023/06/07.
//

import Foundation
import SwiftUI

extension NavigationPath {
    mutating func removeAll() {
        let count = self.count
        self.removeLast(count)
    }
}
