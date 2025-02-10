import SwiftUI

struct BlogDetailView: View {
    let post: BlogPost

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Image
                AsyncImage(url: URL(string: "http://192.168.1.12:1337" + post.attributes.image.url)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .cornerRadius(10)
                } placeholder: {
                    Color.gray.opacity(0.3).frame(height: 300)
                }

                // Title
                Text(post.attributes.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Content
                Text(post.attributes.content)
                    .font(.body)
                    .padding(.top, 10)

                // Publication Date
                Text("Published on: \(formattedDate(post.attributes.publishedAt))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .navigationTitle("Blog Detail")
    }

    // Helper function to format date
    func formattedDate(_ dateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: dateString) {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        }
        return "Unknown date"
    }
}
