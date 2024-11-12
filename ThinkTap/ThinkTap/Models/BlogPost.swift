import Foundation

struct BlogPost: Identifiable, Codable {
    let id: String
    let title: String
    let excerpt: String
    let featureImage: String?
    let html: String
    let author: Author
    let readingTime: Int
    let publishedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case excerpt
        case featureImage = "feature_image"
        case html
        case author
        case readingTime = "reading_time"
        case publishedAt = "published_at"
    }
}

struct Author: Codable {
    let name: String
    let profileImage: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileImage = "profile_image"
    }
} 

extension BlogPost {
    static let samplePosts: [BlogPost] = [
        BlogPost(
            id: "1",
            title: "The Future of Swift and SwiftUI",
            excerpt: "Exploring the latest features and improvements in Swift 5.9 and SwiftUI framework that are revolutionizing iOS development.",
            featureImage: "https://picsum.photos/800/600",
            html: """
                <h2>The Evolution of Swift</h2>
                <p>Swift has come a long way since its introduction. With the latest updates, we're seeing incredible improvements in performance and developer experience.</p>
                <h2>SwiftUI's Growing Ecosystem</h2>
                <p>The SwiftUI framework continues to mature, offering more powerful features for building beautiful, responsive UIs.</p>
            """,
            author: Author(
                name: "John Doe",
                profileImage: "https://picsum.photos/100/100"
            ),
            readingTime: 5,
            publishedAt: Date()
        ),
        BlogPost(
            id: "2",
            title: "Mastering iOS Architecture",
            excerpt: "Deep dive into various iOS architecture patterns including MVVM, Clean Architecture, and their practical applications.",
            featureImage: "https://picsum.photos/800/601",
            html: """
                <h2>Understanding MVVM</h2>
                <p>Model-View-ViewModel has become the de facto standard for iOS development, especially with SwiftUI.</p>
                <h2>Clean Architecture in iOS</h2>
                <p>Learn how to implement clean architecture principles in your iOS applications.</p>
            """,
            author: Author(
                name: "Jane Smith",
                profileImage: "https://picsum.photos/100/101"
            ),
            readingTime: 8,
            publishedAt: Date().addingTimeInterval(-86400)
        ),
        BlogPost(
            id: "3",
            title: "iOS Animation Techniques",
            excerpt: "Learn advanced animation techniques in SwiftUI to create engaging and interactive user experiences.",
            featureImage: "https://picsum.photos/800/602",
            html: """
                <h2>Basic Animations in SwiftUI</h2>
                <p>SwiftUI makes it incredibly easy to add beautiful animations to your views.</p>
                <h2>Advanced Animation Techniques</h2>
                <p>Discover how to create complex, chained animations that delight users.</p>
            """,
            author: Author(
                name: "Mike Johnson",
                profileImage: "https://picsum.photos/100/102"
            ),
            readingTime: 6,
            publishedAt: Date().addingTimeInterval(-172800)
        )
    ]
}
