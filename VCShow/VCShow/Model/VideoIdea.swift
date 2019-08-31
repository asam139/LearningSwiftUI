//
//  VideoIdea.swift
//  VCShow
//
//  Created by Saul Moreno Abril on 31/08/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import Combine

final class VideoIdea: ObservableObject {
    @Published var title: String = ""
    @Published var contentIdea: String = ""
}
