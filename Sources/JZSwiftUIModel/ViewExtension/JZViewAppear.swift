//
//  JZViewAppear.swift
//  
//
//  Created by S JZ on 2023/11/21.
//

import SwiftUI

struct JZViewAppear: ViewModifier {
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

public extension JZSmallModule where Base: View {
    func onFirstAppear(_ action: (() -> ())? = nil) -> some View {
        base.modifier(JZViewAppear(action: action))
    }
}
