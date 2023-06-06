//
//  CoordinatorProtocol.swift
//  AtchI
//
//  Created by DOYEON LEE on 2023/06/06.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
public protocol CoordinatorProtocol: ObservableObject {
    associatedtype LinkType: LinkProtocol

    var path: NavigationPath { get set }
    var sheet: LinkType? { get set }
    
    init(path: Binding<NavigationPath>)
}
