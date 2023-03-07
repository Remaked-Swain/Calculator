//
//  Calculator.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/06.
//

import Foundation

// Model
struct Calculator {
    private struct ArithmeticExpression: Equatable {
        var number: Decimal
        var operation: ArithmeticOperation
        
        func evaluate(with nextNumber: Decimal) -> Decimal {
            switch operation {
            case .add: return number + nextNumber
            case .subtract: return number - nextNumber
            case .multiply: return number * nextNumber
            case .divide: return number / nextNumber
            }
        }
    }
    
    // MARK: Properties
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            carryingNegative = false
            carryingDecimal = false
            carryingZeroCount = 0
            pressedClear = false
        }
    }
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    private var carryingNegative: Bool = false
    private var carryingDecimal: Bool = false
    private var carryingZeroCount: Int = 0
    private var pressedClear: Bool = false
    
    // MARK: Computed Properties
    var displayText: String {
        return numberToString(number: number, withDots: true)
    }
    var showAllClear: Bool {
        return (newNumber == nil && expression == nil && result == nil) || pressedClear
    }
    private var number: Decimal? {
        if pressedClear || carryingDecimal {
            return newNumber
        }
        
        return newNumber ?? expression?.number ?? result
    }
    private var containsDecimal: Bool {
        return numberToString(number: number).contains(".")
    }

    // MARK: Methods
    // 숫자 키패드 입력
    mutating func setDigit(_ digit: Digit) {
        if containsDecimal && (digit == .zero) {
            carryingZeroCount += 1
        } else if canAddDigit(digit) {
            let str = numberToString(number: newNumber)
            newNumber = Decimal(string: str.appending("\(digit.rawValue)"))
        }
    }
    
    // 연산자 키패드 입력
    mutating func setOperation(_ operation: ArithmeticOperation) {
        guard var number = newNumber ?? result else { return }
        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }
        expression = ArithmeticExpression(number: number, operation: operation)
        newNumber = nil
    }
    
    // 양수, 음수 전환
    mutating func toggleSign() {
        if let number = newNumber {
            newNumber = -number
            return
        }
        
        if let number = result {
            result = -number
            return
        }
        
        carryingNegative.toggle()
    }
    
    // 퍼센트 연산자 입력
    mutating func setPercent() {
        if let number = newNumber {
            newNumber = number / 100
            return
        }
        
        if let number = result {
            result = number / 100
            return
        }
    }
    
    // 소수점 입력
    mutating func setDecimal() {
        if containsDecimal { return }
        carryingDecimal = true
    }
    
    // 최종 연산 결과 반환
    mutating func evaluate() {
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        result = expressionToEvaluate.evaluate(with: number)
        expression = nil
        newNumber = nil
    }
    
    // 계산식 초기화
    mutating func allClear() {
        newNumber = nil
        expression = nil
        result = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
    }
    
    // 최근 입력만을 되돌리기
    mutating func clear() {
        newNumber = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
        pressedClear = true
    }
    
    // MARK: Helpers
    // 숫자 -> 문자열
    private func numberToString(number: Decimal?, withDots: Bool = false) -> String {
        var tmpString = (withDots ? number?.formatted(.number) : number.map(String.init)) ?? "0"
        
        if carryingNegative {
            tmpString.insert("-", at: tmpString.startIndex)
        }
        
        if carryingDecimal {
            tmpString.insert(".", at: tmpString.endIndex)
        }
        
        if carryingZeroCount > 0 {
            tmpString.append(String(repeating: "0", count: carryingZeroCount))
        }
        
        return tmpString
    }
    
    // 숫자 무결성 검사
    private func canAddDigit(_ digit: Digit) -> Bool {
        return number != nil || digit != .zero
    }
    
    // 연산자 버튼 선택 시 하이라이팅 기능
    func operationIsHighlighted(_ operation: ArithmeticOperation) -> Bool {
        return (expression?.operation == operation) && (newNumber == nil)
    }
}
