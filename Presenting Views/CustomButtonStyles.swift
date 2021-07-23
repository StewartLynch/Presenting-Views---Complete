//
//  CustomButtonStyles.swift
//  ButtonStyling
//
//  Created by Stewart Lynch on 2020-10-11.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var font: Font = .title
    var padding: CGFloat = 8
    var bgColor = Color(.systemBackground)
    var fgColor = Color(.label)
    var cornerRadius: CGFloat = 8
    func makeBody(configuration: Configuration) -> some View {
        withAnimation(.spring()) {
            configuration.label
                .font(font)
                .padding(padding)
                .background(bgColor)
                .foregroundColor(fgColor)
                .cornerRadius(cornerRadius)
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
    }
}

extension ButtonStyle where Self == CustomButtonStyle {
    static var customButtonStyle: CustomButtonStyle {
        CustomButtonStyle()
    }
}
