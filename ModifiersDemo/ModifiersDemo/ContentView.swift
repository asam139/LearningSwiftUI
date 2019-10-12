//
//  ContentView.swift
//  ModifiersDemo
//
//  Created by Saul Moreno Abril on 12/10/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {

                }, label: {
                    Text("Continue")
                    .modifier(CustomViewModifier())
                })
                Button(action: {

                }, label: {
                    Text("More Details")
                        .modifier(CustomViewModifier(fontSize: 10, backgroundColor: .orange))
                })
                Button(action: {

                }, label: {
                    Text("Cancel")
                        .modifier(CustomViewModifier(backgroundColor: .red))
                })
            }
        }
    }
}

struct CustomViewModifier: ViewModifier {

    @State var fontSize: CGFloat = 16
    @State var backgroundColor = Color.blue

    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.white)
            .font(.system(size: 16))
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .strokeBorder(style: StrokeStyle(lineWidth: 3))
                    .foregroundColor(Color(.sRGB, red: 0.1, green: 0.1, blue: 0.1, opacity: 1))
            )
            .cornerRadius(4)
            .shadow(color: .init(.sRGB, red: 0.1, green: 0.1, blue: 0.1, opacity: 1),
                    radius: 5, x: 0, y: 0)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
