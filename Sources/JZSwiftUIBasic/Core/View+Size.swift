//
//  SwiftUIView.swift
//  
//
//  Created by S JZ on 2024/2/17.
//

import SwiftUI

// MARK: - 获取View的高度
@available(macOS 10.15, *)
public extension View {
    func readHeight(onChange action: @escaping (CGFloat) -> ()) -> some View {
        background(heightReader).onPreferenceChange(HeightPreferenceKey.self, perform: action)
    }
}

@available(macOS 10.15, *)
private extension View {
    var heightReader: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }
}

@available(macOS 10.15, *)
fileprivate struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
