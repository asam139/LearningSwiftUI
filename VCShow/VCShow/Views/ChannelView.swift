//
//  ChannelView.swift
//  VCShow
//
//  Created by Saul Moreno Abril on 31/08/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct ChannelView: View {

    @State private var channelName = "My Channel"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Channel Name", text: $channelName)
                Divider()
                Button(action: {
                    
                }) {
                    Text("Dismiss this VC")
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Channel Data")
        }
    }
}

struct ChannelView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelView()
    }
}
