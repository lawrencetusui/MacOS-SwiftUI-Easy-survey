//
//  survey.swift
//  Easy Survey
//
//  Created by Lawrence Tsui on 26/1/21.
//

import Foundation
struct  survey: Decodable {
    let text: String
    let children: [survey]?
}
