//
//  CalculatorButtonStyle.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/06.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 32, weight: .medium))
            .frame(width: size, height: size)
            .background(self.backgroundColor)
            .foregroundColor(self.foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.2)
                }
            }
            .clipShape(Capsule())
    }
}

struct CalculatorButtonStyle_Previews: PreviewProvider {
    static let button: ButtonType = .operation(.add)
    
    static var previews: some View {
        Button(button.description) {
            // action
        }
        .buttonStyle(CalculatorButtonStyle(size: 80, backgroundColor: button.backgroundColor, foregroundColor: button.foregroundColor))
    }
}
