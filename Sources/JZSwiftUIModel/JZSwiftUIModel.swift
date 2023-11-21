// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

// 使用Kingfisher的
public struct JZSmallModule<Base> {
    public let base: Base
    public init(_ base: Base) { self.base = base }
}

public extension Scene {
    var jz: JZSmallModule<Self> { .init(self) }
}

public extension View {
    var jz: JZSmallModule<Self> { .init(self) }
}

public extension AnyTransition {
    static var jz: JZSmallModule<Self> { JZSmallModule(.identity) }
}

public extension JZSmallModule where Base == Any {
    init(_ content: Base) { self.base = content }
}

public extension NSObjectProtocol {
    var jz: JZSmallModule<Self> { .init(self) }
}
