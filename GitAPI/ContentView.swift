//
//  ContentView.swift
//  GitAPI
//
//  Created by Anna Ceglia on 03/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: viewModel.user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 120, height: 120)
            
            Text(viewModel.user?.login ?? "Login Placeholder")
                .bold()
                .font(.title3)
            
            Text(viewModel.user?.bio ?? "Bio Placeholder")
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            do {
                viewModel.user = try await viewModel.getUser()
            } catch GHError.invalidUrl {
                print("invalid Url")
            } catch GHError.invalidResponse {
                print("invalid Response")
            } catch GHError.invalidData {
                print("invalid Data")
            } catch {
                print("unexpected Error")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
