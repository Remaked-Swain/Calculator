//
//  ButtonType.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/06.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case negative
    case percent
    case decimal
    case equals
    case allClear
    case clear
    
    var description: String {
        switch self {
        case .digit(let digit): return digit.description
        case .operation(let operation): return operation.description
        case .negative: return "±"
        case .percent: return "%"
        case .decimal: return "."
        case .equals: return "="
        case .allClear: return "AC"
        case .clear: return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .percent: return Color(.lightGray)
        case .operation, .equals: return .orange
        case .digit, .decimal: return .secondary
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .percent: return .black
        default: return .white
        }
    }
}

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String { return "\(rawValue)" }
}

enum ArithmeticOperation: CaseIterable, CustomStringConvertible {
    case add, subtract, multiply, divide
    
    var description: String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "−"
        case .multiply:
            return "×"
        case .divide:
            return "÷"
        }
    }
}
