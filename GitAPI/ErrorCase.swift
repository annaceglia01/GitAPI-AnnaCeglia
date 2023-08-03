//
//  ErrorCase.swift
//  GitAPI
//
//  Created by Anna Ceglia on 27/07/23.
//

import Foundation

enum GHError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
