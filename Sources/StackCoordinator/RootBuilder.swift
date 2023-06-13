//
//  RootBuilder.swift
//  AtchI
//
//  Created by DOYEON LEE on 2023/06/06.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
public struct RootBuilder<Content: View>: View  {

    @ObservedObject var pathManager = NavigationPathManager.shared
    var content: (Binding<NavigationPath>) -> Content
    
    public init(
        @ViewBuilder content: @escaping (Binding<NavigationPath>) -> Content
    ) {
         self.content = content
     }

    public var body: some View {
        NavigationStack(path: $pathManager.path) {
            ZStack {
                content($pathManager.path)
            }
        }
    }
}
