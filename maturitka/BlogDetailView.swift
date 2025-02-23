import SwiftUI

// View ktoré zobrazuje detail blogu - detail screen
struct BlogDetailView: View {
    // Property pre držanie dát blog postu
    let post: BlogPost

    // Main view builder - tu definujeme layout
    var body: some View {
        // Scrollovateľný kontajner pre content
        ScrollView {
            // Vertical stack s leadingom a spacingom 20
            VStack(alignment: .leading, spacing: 20) {
                // Optional chaining - checkujeme či máme image a jeho URL
                if let image = post.image?.first, let imageUrl = image.formats?.large?.url ?? image.formats?.medium?.url {
                    // Async loading obrázku z API endpointu
                    AsyncImage(url: URL(string: "http://192.168.1.12:1337" + imageUrl)) { image in
                        // Image view s responzívnymi vlastnostami
                        image.resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                    } placeholder: {
                        // Placeholder view kým sa image loaduje
                        Color.gray.opacity(0.3)
                            .frame(height: 200)
                            .cornerRadius(10)
                    }
                }

                // Iterujeme cez content blocky
                ForEach(post.content.indices, id: \.self) { blockIndex in
                                    let block = post.content[blockIndex]
                                    ForEach(block.children.indices, id: \.self) { childIndex in
                                        let text = block.children[childIndex].text
                                        // Zobrazíme text len ak nie je prázdny
                                        if !text.isEmpty {
                                            Text(text)
                                                .font(.body)
                                                .foregroundColor(.primary)
                                                .padding(.bottom, 5)
                                        }
                                    }
                                }

                // Spacer na konci stacku
                Spacer()
            }
            .padding()
        }
        // Nastavíme title v navigation bare
        .navigationTitle(post.title)
    }
}
