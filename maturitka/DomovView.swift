import SwiftUI

struct DomovView: View {
    @StateObject private var apiService = APIService()
    @State private var selectedPost: BlogPost? = nil
    @State private var showDetailView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    Text("Príspevky")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    // Nahladovky blogov
                    ForEach(apiService.blogPosts) { post in
                        Button(action: {
                            selectedPost = post
                            showDetailView.toggle()
                        }) {
                            BlogPostPreviewView(post: post)
                        }
                    }
                }
                .onAppear {
                    apiService.fetchPosts()
                }
            }
            .sheet(isPresented: $showDetailView) {
                if let post = selectedPost {
                    BlogDetailView(post: post)
                }
            }
        }
    }
}

#Preview {
    MainContentView()
}
