import SwiftUI

struct BlogPostPreviewView: View {
    let post: BlogPost

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // fotka
            AsyncImage(url: URL(string: post.image_url)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .cornerRadius(8)
            } placeholder: {
                Color.gray.opacity(0.3).frame(height: 150)
            }

            // nazov
            Text(post.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)

            Divider()
        }
        .padding(.horizontal)
    }
}
