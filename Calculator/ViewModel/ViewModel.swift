//
//  ViewModel.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/06.
//

import Foundation

// ViewModel
final class ViewModel: ObservableObject {
    @Published private var calculator = Calculator()
    
    var displayText: String {
        return calculator.displayText
    }
    
    var buttons: [[ButtonType]] {
        let clearType: ButtonType = calculator.showAllClear ? .allClear : .clear
        return [
            [clearType, .negative, .percent, .operation(.divide)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiply)],
            [.digit(.four), .digit(.five), .digit(.six), .operation(.subtract)],
            [.digit(.one), .digit(.two), .digit(.three), .operation(.add)],
            [.digit(.zero), .decimal, .equals]
        ]
    }
    
    func performAction(keypad buttonType: ButtonType) {
        switch buttonType {
        case .digit(let digit): calculator.setDigit(digit)
        case .operation(let operation): calculator.setOperation(operation)
        case .negative: calculator.toggleSign()
        case .percent: calculator.setPercent()
        case .decimal: calculator.setDecimal()
        case .equals: calculator.evaluate()
        case .allClear: calculator.allClear()
        case .clear: calculator.clear()
        }
    }
    
    func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
        guard case .operation(let operation) = buttonType else { return false }
        return calculator.operationIsHighlighted(operation)
    }
}
