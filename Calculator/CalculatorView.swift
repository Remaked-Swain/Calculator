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
            
            Text("fesf")
                .foregroundColor(Color.white)
            
//            ButtonPadView()
        }
        .background(Color.black)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
