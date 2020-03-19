//
//  PaginatedResponse.swift
//  MovieSwift
//
//  Created by Saul Moreno Abril on 19/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation

struct PaginatedResponse<T: Codable>: Codable {
    let page: Int?
    let total_results: Int?
    let total_pages: Int?
    let results: [T]
}
