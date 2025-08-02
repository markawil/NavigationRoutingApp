//
//  GithubUser.swift
//  SwiftPractice
//
//  Created by Mark Wilkinson on 3/4/25.
//

import SwiftUI

@MainActor
class GHViewModel: ObservableObject {
    
     @Published var user: GithubUser?
    var username: String
    
    init(username: String) {
        self.username = username
    }
    
    func getUser() async throws {
        let urlString = "https://api.github.com/users/\(username)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            throw URLError(.badURL)
        }
        
        do {
            self.user = try await download(from: url)
        } catch let error {
            print("error downloading: \(error.localizedDescription)")
        }
    }
    
    func download<T: Codable>(from url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try decoder.decode(T.self, from: data)
        print("successfully decoded user from JSON.")
        return decoded
    }
}

struct GithubUserView: View {
    
    @StateObject var vm: GHViewModel = GHViewModel(username: "markawil")
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: vm.user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundStyle(.secondary)
                    
            }
            .frame(width: 120, height: 120)
            
            Text(vm.username)
                .bold()
                .font(.title3)
            Text(vm.user?.bio ?? "This is where the Github bio would go. Let's just say I am a software engineer.")
                .padding()
            Spacer()
        }
        .padding()
        .task {
            try? await vm.getUser()
        }
    }
}

#Preview {
    GithubUserView()
}

struct GithubUser: Codable {
    let id: Int
    let login: String
    let avatarUrl: String
    let bio: String?
}

enum GithubUserError: Error {
    case invalidData
}
