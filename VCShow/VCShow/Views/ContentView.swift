//
//  ContentView.swift
//  VCShow
//
//  Created by Saul Moreno Abril on 31/08/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingSecondVC = false
    
    @ObservedObject var videoIdea = VideoIdea()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(videoIdea.title)
                    .font(.title)
                Text(videoIdea.contentIdea)
                    .font(.subheadline)
                Divider()
                NavigationLink(destination: ChannelView()){
                    Text("Add Channel")
                }
                Button(action: {
                    self.showingSecondVC.toggle()
                }) {
                    Text("Add New Idea")
                }.sheet(isPresented: $showingSecondVC) {
                    SecondView(videoTitle: self.$videoIdea.title,
                               videoContent: self.$videoIdea.contentIdea)
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Channel Name")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
