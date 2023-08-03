//
//  ViewModel.swift
//  GitAPI
//
//  Created by Anna Ceglia on 27/07/23.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
    
    @Published var user: GitHubUser?
    
    func getUser() async throws -> GitHubUser {
        let endpoint = "https://api.github.com/users/annaceglia01"
        
        guard let url = URL(string: endpoint) else {
            throw GHError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GHError.invalidData
        }
        
    }
}

