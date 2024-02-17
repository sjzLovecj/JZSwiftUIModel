//
//  ViewFirstAppear.swift
//
//
//  Created by S JZ on 2024/2/17.
//

import SwiftUI

/**
 View第一次显示时，该做的事情
 */
@available(macOS 10.15, *)
@available(iOS 13.0, *)
struct ViewFirstAppear: ViewModifier {
    let action: (() -> ())?
    @State private var isFirst: Bool = true

    func body(content: Content) -> some View {
        content.onAppear {
            if isFirst {
                isFirst = false
                
                action?()
            }
        }
    }
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public extension View {
    func onFirstAppear(_ action: (() -> ())? = nil) -> some View {
        self.modifier(ViewFirstAppear(action: action))
    }
}
