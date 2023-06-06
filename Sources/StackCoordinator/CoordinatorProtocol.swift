//
//  CoordinatorProtocol.swift
//  AtchI
//
//  Created by DOYEON LEE on 2023/06/06.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
public protocol CoordinatorProtocol: ObservableObject, Hashable {
    associatedtype LinkType: LinkProtocol
    
    var path: NavigationPath { get set }
    var sheet: LinkType? { get set }
    
    init(path: Binding<NavigationPath>)
    
    static func == (lhs: Self, rhs: Self) -> Bool
    func hash(into hasher: inout Hasher)
    
    var id: String { get }
}

extension CoordinatorProtocol {
    static func == (
        lhs: any CoordinatorProtocol,
        rhs: any CoordinatorProtocol
    ) -> Bool {
        lhs.id == rhs.id ? true : false
    }
    
    func hash(into hasher: inout Hasher) {
    }
    
    var id: String {
        String(describing: self)
    }
}
