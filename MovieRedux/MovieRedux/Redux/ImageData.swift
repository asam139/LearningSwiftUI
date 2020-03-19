//
//  ImageData.swift
//  MovieRedux
//
//  Created by Saul Moreno Abril on 19/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageData: Codable, Identifiable {
    let id = UUID()
    let aspect_ratio: Float
    let file_path: String
    let height: Int
    let width: Int
}
