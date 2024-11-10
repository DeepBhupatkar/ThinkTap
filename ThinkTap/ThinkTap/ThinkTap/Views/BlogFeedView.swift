import SwiftUI

struct BlogFeedView: View {
    @StateObject private var viewModel = BlogFeedViewModel()
    @State private var currentIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                if viewModel.posts.isEmpty {
                    ProgressView()
                } else {
                    GeometryReader { geometry in
                        CardsStack(
                            posts: viewModel.posts,
                            currentIndex: $currentIndex,
                            screenSize: geometry.size
                        )
                    }
                }
            }
            .navigationTitle("ThinkTap")
        }
        .task {
            await viewModel.fetchPosts()
        }
    }
}

struct CardsStack: View {
    let posts: [BlogPost]
    @Binding var currentIndex: Int
    let screenSize: CGSize
    
    var body: some View {
        ZStack {
            ForEach(posts.indices.prefix(3).reversed(), id: \.self) { index in
                let offset = CGFloat(index - currentIndex)
                BlogCardView(post: posts[index])
                    .frame(width: screenSize.width - 40)
                    .offset(x: 0, y: offset * 8)
                    .scaleEffect(1 - abs(offset) * 0.1)
                    .rotationEffect(.degrees(offset * 5))
                    .gesture(
                        DragGesture()
                            .onEnded { gesture in
                                withAnimation(.spring()) {
                                    if gesture.translation.width < -50 && currentIndex < posts.count - 1 {
                                        currentIndex += 1
                                    } else if gesture.translation.width > 50 && currentIndex > 0 {
                                        currentIndex -= 1
                                    }
                                }
                            }
                    )
            }
        }
    }
} 