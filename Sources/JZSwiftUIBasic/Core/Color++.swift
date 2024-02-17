//
//  SwiftUIView.swift
//  
//
//  Created by S JZ on 2024/2/17.
//

import SwiftUI

@available(macOS 10.15, *)
public extension Color {
    
    init(hex: Int, alpha: CGFloat = 1.0) {
        if hex > 0xFFFFFF {
            self.init(red: 1.0, green: 1.0, blue: 1.0, opacity: alpha)
        }else {
            let red = Float((hex & 0xFF0000) >> 16) / 255.0
            let green = Float((hex & 0xFF00) >> 8) / 255.0
            let blue = Float((hex & 0xFF)) / 255.0
            self.init(red: Double(red), green: Double(green), blue: Double(blue), opacity: alpha)
        }
    }
    
    init(hexStr: String, alpha: CGFloat = 1.0) {
        // 替换字符串
        var colorStr = hexStr.replacingOccurrences(of: "#", with: "")
        colorStr = colorStr.replacingOccurrences(of: "0x", with: "")
        colorStr = colorStr.replacingOccurrences(of: "0X", with: "")
        
        if !colorStr.isEmpty, colorStr.count <= 6 {
            // 将字符串转为Int
            let scanner = Scanner(string: colorStr)
            var result: UInt64 = 0
            scanner.scanHexInt64(&result)
            self.init(hex: Int(result), alpha: alpha)
        }else {
            // 如果超出数值，那么将返回白色
            self.init(hex: 0xFFFFFF, alpha: alpha)
        }
    }
    
}
