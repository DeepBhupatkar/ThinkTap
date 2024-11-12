import Foundation

@MainActor
class BlogFeedViewModel: ObservableObject {
    @Published var posts: [BlogPost] = []
    private let apiService = GhostAPIService(
        baseURL: "YOUR_GHOST_API_URL",
        apiKey: "YOUR_API_KEY"
    )
    
    func fetchPosts() async {
        
       
                posts = BlogPost.samplePosts
//        do {
//            posts = try await apiService.fetchPosts()
//        } catch {
//            print("Error fetching posts: \(error)")
//        }
    }
} 
