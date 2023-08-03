//
//  Mof.swift
//  GitAPI
//
//  Created by Anna Ceglia on 27/07/23.
//

import Foundation

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String?
    let bio: String?
}
