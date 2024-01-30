//
//  TotalText.swift
//  FirstProject
//
//  Created by Sandeep Kulkarni on 30/01/24.
//

import SwiftUI

struct TotalText: View {
    var value: String = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 60))
            .fontWeight(.light)
            .padding()
            .foregroundColor(.white)
            .lineLimit(1)
    }
}

#Preview {
    TotalText().background(.black)
}
