//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Saul Moreno Abril on 10/06/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct ProfileHost : View {
    @State var profile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: self.profile)
        }
        .padding()
    }
}

#if DEBUG
struct ProfileHost_Previews : PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
#endif
