//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/06.
//

import SwiftUI

struct CalculatorButton: View {
    @EnvironmentObject private var viewModel: ViewModel
    let buttonType: ButtonType
    
    var body: some View {
        Button(buttonType.description) {
            viewModel.performAction(keypad: buttonType)
        }
        .buttonStyle(CalculatorButtonStyle(
            size: getButtonSize(),
            backgroundColor: getBackgroundColor(),
            foregroundColor: getForegroundColor(),
            isWide: buttonType == .digit(.zero))
        )
    }
    
    func getButtonSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let buttonCount: CGFloat = 4.0
        let spacingCount = buttonCount + 1
        return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
    }
    
    private func getBackgroundColor() -> Color {
        return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.foregroundColor : buttonType.backgroundColor
    }
    
    private func getForegroundColor() -> Color {
        return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
    }
}
