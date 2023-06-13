//
//  File.swift
//  
//
//  Created by DOYEON LEE on 2023/06/14.
//

import Foundation
import SwiftUI

class NavigationPathManager: ObservableObject {
    @Published var path = NavigationPath()
    
    static let shared = NavigationPathManager()
    
    private init() {}
}
