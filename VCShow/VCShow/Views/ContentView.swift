//
//  ContentView.swift
//  VCShow
//
//  Created by Saul Moreno Abril on 31/08/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World").font(.title)
            Text("Video Content").font(.subheadline)
            Divider()
            NavigationLink(destination: ChannelView()){
                Text("Add Channel")
            }
            Button(action: {
                
            }) {
                Text("Add New Idea")
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("Channel Name")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
