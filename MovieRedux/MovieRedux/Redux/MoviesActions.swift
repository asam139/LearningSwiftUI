//
//  MoviesActions.swift
//  MovieRedux
//
//  Created by Saul Moreno Abril on 19/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SwiftUIFlux
import Backend

struct MoviesActions {
    // MARK: - Sync
    struct SetPopular: Action {
        let response: PaginatedResponse<Movie>
    }
    
    // MARK: - Async
    struct FetchPopular: AsyncAction {
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            APIService.shared.GET(endpoint: .popular, params: nil)
            {
                (result: Result<PaginatedResponse<Movie>, APIService.APIError>) in
                switch result {
                case let .success(response):
                    dispatch(SetPopular(response: response))
                case .failure(_):
                    break
                }
            }
        }
    }
}
