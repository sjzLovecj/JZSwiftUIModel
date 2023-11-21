//
//  SwiftUIView.swift
//  
//
//  Created by S JZ on 2023/11/21.
//

import SwiftUI

public extension JZSmallModule where Base: View {
    func onChange<V>(of value: V, _ action: @escaping (_ oldValue: V, _ newValue: V) -> Void) -> some View where V : Equatable {
        if #available(iOS 17.0, macOS 14.0, *) {
            return base.onChange(of: value, initial: false) { oldValue, newValue in
                action(oldValue, newValue)
            }
        }else {
            return base.onChange(of: value) { newValue in
                action(value, newValue)
            }
        }
    }
}









