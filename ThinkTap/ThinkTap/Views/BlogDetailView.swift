import SwiftUI

struct BlogDetailView: View {
    let post: BlogPost
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Feature Image
                if let imageURL = post.featureImage {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.2))
                    }
                    .frame(height: 300)
                    .clipShape(Rectangle())
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    // Title
                    Text(post.title)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                    
                    // Author info
                    HStack(spacing: 12) {
                        if let profileImage = post.author.profileImage {
                            AsyncImage(url: URL(string: profileImage)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Circle()
                                    .foregroundColor(.gray.opacity(0.2))
                            }
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        }
                        
                        VStack(alignment: .leading) {
                            Text(post.author.name)
                                .font(.headline)
                            Text("\(post.readingTime) min read • \(post.publishedAt.formatted(date: .abbreviated, time: .omitted))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    // Content
                    Text(post.html.htmlToString())
                        .font(.system(.body, design: .serif))
                        .lineSpacing(8)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension String {
    func htmlToString() -> String {
        guard let data = self.data(using: .utf8),
              let attributedString = try? NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil
              ) else {
            return self
        }
        return attributedString.string
    }
} 