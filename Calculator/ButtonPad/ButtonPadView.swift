//
//  ButtonPadView.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/06.
//

import SwiftUI

struct ButtonPadView: View {
    var buttons: [[ButtonType]] {
        [
            [.allClear, .negative, .percent, .operation(.divide)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiply)],
            [.digit(.four), .digit(.five), .digit(.six), .operation(.subtract)],
            [.digit(.one), .digit(.two), .digit(.three), .operation(.add)],
            [.digit(.zero), .decimal, .equals]
        ]
    }
    
    var body: some View {
        VStack(spacing: Constants.padding) {
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButton(buttonType: button)
                    }
                }
            }
        }
    }
}

struct ButtonPadView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPadView()
    }
}
