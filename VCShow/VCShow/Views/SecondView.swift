//
//  SecondView.swift
//  VCShow
//
//  Created by Saul Moreno Abril on 31/08/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    
    @State private var videoTitle = "Great Title"
    @State private var videoContent = "Great Content"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Video title", text: $videoTitle)
                TextField("Video Content", text: $videoContent)
                Divider()
                Button(action: {
                    
                }) {
                    Text("Dismiss this VC")
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Video")
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
