//
//  ContentView.swift
//  Calculator
//
//  Created by Swain Yun on 2023/03/05.
//

import SwiftUI

struct CalculatorView: View {
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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        ButtonPadView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
