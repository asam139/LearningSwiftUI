//
//  Person.swift
//  ListCrudOperationsLBTA
//
//  Created by Brian Voong on 9/23/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

struct Person: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let image: UIImage
    let jobTitle: String
}
