//
//  BaseCoordinator.swift
//  
//
//  Created by DOYEON LEE on 2023/06/07.
//

import Foundation
import SwiftUI

public class BaseCoordinator<L: LinkProtocol>: CoordinatorProtocol, Hashable {

    public var path = NavigationPathManager.shared.path
    @Published public var sheet: L?
    
    public init() { }
    
    public static func == (
        lhs: BaseCoordinator,
        rhs: BaseCoordinator
    ) -> Bool {
        lhs.id == rhs.id ? true : false
    }
    
    public func hash(into hasher: inout Hasher) {
    }
    
    private var id: String {
        String(describing: self)
    }
}

extension BaseCoordinator {
    public func push(_ link: L) {
        self.path.append(
            link
        )
    }
}
