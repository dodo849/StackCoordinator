//
//  BaseBuilder.swift
//  AtchI
//
//  Created by DOYEON LEE on 2023/06/06.
//

import Foundation
import SwiftUI

public struct ChildBuilder<Content: View, Coordinator: CoordinatorProtocol>: BuilderProtocol {
    
    @ObservedObject public var coordinator: Coordinator
    var content: () -> Content
    
    public init(coordinator: Coordinator, @ViewBuilder content: @escaping () -> Content) {
        self.coordinator = coordinator
        self.content = content
    }

    public var body: some View {
        content()
            .sheet(item: $coordinator.sheet) { link in
                AnyView(link.matchView())
            }
            .navigationDestination(for: Coordinator.LinkType.self) { link in
                AnyView(link.matchView())
            }
    }
}
