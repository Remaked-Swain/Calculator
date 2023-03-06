//
//  Calculator.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/06.
//

import Foundation

// Model
struct Calculator {
    // MARK: Properties
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
    private var newNumber: Decimal?
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    // MARK: Computed Properties
    var displayText: String {
        return numberToString(number: number, withDots: true)
    }
    private var number: Decimal? {
        return newNumber ?? expression?.number ?? result
    }
    
    // 숫자 키패드 입력
    mutating func setDigit(_ digit: Digit) {
        guard canAddDigit(digit) else { return }
        let str = numberToString(number: newNumber)
        newNumber = Decimal(string: str.appending("\(digit.rawValue)"))
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
        
    }
    
    // 퍼센트 연산자 입력
    mutating func setPercent() {
        
    }
    
    // 소수점 입력
    mutating func setDecimal() {
        
    }
    
    // 최종 연산 결과 반환
    mutating func evaluate() {
        
    }
    
    // 계산식 초기화
    mutating func allClear() {
        
    }
    
    // 삭제
    mutating func clear() {
        
    }
    
    // MARK: Helpers
    // 숫자 -> 문자열
    private func numberToString(number: Decimal?, withDots: Bool = false) -> String {
        return (withDots ? number?.formatted(.number) : number.map(String.init)) ?? "0"
    }
    
    // 숫자 무결성 검사
    private func canAddDigit(_ digit: Digit) -> Bool {
        return number != nil || digit != .zero
    }
    
    func operationIsHighlighted(_ operation: ArithmeticOperation) -> Bool {
        return (expression?.operation == operation) && (newNumber == nil)
    }
}
