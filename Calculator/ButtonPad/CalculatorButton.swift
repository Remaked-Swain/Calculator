//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/06.
//

import SwiftUI

struct CalculatorButton: View {
    let buttonType: ButtonType
    
    var body: some View {
        Button(buttonType.description) {
            // action
        }
        .buttonStyle(CalculatorButtonStyle(
            size: 80,
            backgroundColor: buttonType.backgroundColor,
            foregroundColor: buttonType.foregroundColor)
        )
    }
    
    func getButtonSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let buttonCount: CGFloat = 4.0
        let spacingCount = buttonCount + 1
        return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
    }
}
