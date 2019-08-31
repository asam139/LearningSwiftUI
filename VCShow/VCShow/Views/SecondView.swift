//
//  SecondView.swift
//  VCShow
//
//  Created by Saul Moreno Abril on 31/08/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var videoTitle: String
    @Binding var videoContent: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Video title", text: $videoTitle)
                TextField("Video Content", text: $videoContent)
                Divider()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
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

//struct SecondView_Previews: PreviewProvider {
//    @ObservedObject var videoIdea = VideoIdea()
//
//    static var previews: some View {
//        SecondView(videoTitle: self.$videoIdea.title, videoContent: self.$videoIdea.contentIdea)
//    }
//}
