//
//  ContentView.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/05.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            displayText
            
            buttonPad
        }
        .padding(Constants.padding)
        .background(Color.black)
    }
}

extension CalculatorView {
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.padding) {
            ForEach(viewModel.buttons, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButton(buttonType: button)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(ViewModel())
    }
}
