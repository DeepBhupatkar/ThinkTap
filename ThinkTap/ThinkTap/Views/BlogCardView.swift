import SwiftUI

struct BlogCardView: View {
    let post: BlogPost
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
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
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                Text(post.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(post.excerpt)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack {
                    // Author Image
                    if let profileImage = post.author.profileImage {
                        AsyncImage(url: URL(string: profileImage)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Circle()
                                .foregroundColor(.gray.opacity(0.2))
                        }
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    }
                    
                    Text(post.author.name)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Button(action: { BlogDetailView.self}) {
                        Text("View More")
                            .font(.caption)
                            .fontWeight(.medium)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
            }
            .padding()
        }
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
} 
