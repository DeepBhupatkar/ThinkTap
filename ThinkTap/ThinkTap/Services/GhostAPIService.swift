import Foundation

class GhostAPIService {
    private let baseURL: String
    private let apiKey: String
    
    init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func fetchPosts() async throws -> [BlogPost] {
        let endpoint = "\(baseURL)/ghost/api/v3/content/posts/?key=\(apiKey)&include=authors"
        
        guard let url = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(GhostResponse.self, from: data)
        return response.posts
    }
}

struct GhostResponse: Codable {
    let posts: [BlogPost]
} 