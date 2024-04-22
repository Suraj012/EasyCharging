//
//  SwiftUIView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/02/2023.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) { // Adjust alignment and spacing
            Text(placeholder) // Display title placeholder
                .font(.caption)
                .foregroundColor(.gray)
                .alignmentGuide(.leading) { _ in
                    0 // Align text to leading edge
                }
            
            ZStack(alignment: .leading) {
                TextField(placeholder, text: $text)
                    .foregroundColor(.black)
                    .padding(.all, 12)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, lineWidth: 1.0))
            }
        }
        .padding(.horizontal)
    }
}
