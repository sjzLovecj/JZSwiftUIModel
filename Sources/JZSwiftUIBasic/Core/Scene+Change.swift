//
//  SwiftUIView.swift
//  
//
//  Created by S JZ on 2024/2/17.
//

import SwiftUI

@available(macOS 11.0, *)
@available(iOS 14.0, *)
public extension Scene {
    func onChange<V>(of value: V, _ action: @escaping (_ oldValue: V, _ newValue: V) -> Void) -> some Scene where V : Equatable {
        if #available(iOS 17.0, macOS 14.0, *) {
            return self.onChange(of: value, initial: false) { oldValue, newValue in
                action(oldValue, newValue)
            }
        }
        
        return self.onChange(of: value) { newValue in
            action(value, newValue)
        }
    }
}
