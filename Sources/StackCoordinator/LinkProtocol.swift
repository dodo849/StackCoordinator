//
//  LinkProtocol.swift
//  AtchI
//
//  Created by DOYEON LEE on 2023/06/06.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
public protocol LinkProtocol: Hashable, Identifiable {
    func matchView(
    ) -> any View
}

public extension LinkProtocol {
    var id: String {
        String(describing: self)
    }
}
