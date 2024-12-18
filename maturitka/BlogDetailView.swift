import SwiftUI

struct BlogDetailView: View {
    let post: BlogPost

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Fotka
                AsyncImage(url: URL(string: post.image_url)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .cornerRadius(10)
                } placeholder: {
                    Color.gray.opacity(0.3).frame(height: 300)
                }

                // Nazov
                Text(post.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Obash
                Text(post.content)
                    .font(.body)
                    .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle("Blog Detail")
    }
}

