import SwiftUI

struct BlogPostPreviewView: View {
    let post: BlogPost

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Image
            AsyncImage(url: URL(string: "http://192.168.1.12:1337" + post.attributes.image.url)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .cornerRadius(8)
            } placeholder: {
                Color.gray.opacity(0.3).frame(height: 150)
            }

            // Title
            Text(post.attributes.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)

            Divider()
        }
        .padding(.horizontal)
    }
}
