//
//  UserData.swift
//  Landmarks
//
//  Created by Saul Moreno Abril on 06/06/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject  {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }
    var landmarks = landmarkData {
        didSet {
            didChange.send(self)
        }
    }
}
