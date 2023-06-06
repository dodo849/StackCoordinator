//
//  BaseCoordinator.swift
//  
//
//  Created by DOYEON LEE on 2023/06/07.
//

import Foundation
import SwiftUI

public class BaseCoordinator<L: LinkProtocol>: CoordinatorProtocol, Hashable {

    @Binding public var path: NavigationPath
    @Published public var sheet: L?
    
    public required init(path: Binding<NavigationPath>) {
        _path = path
    }
    
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
