import Foundation

struct BlogPost: Identifiable, Codable {
    let id: Int
    let attributes: BlogAttributes
}

struct BlogAttributes: Codable {
    let title: String
    let content: String
    let image: BlogImage
    let publishedAt: String
}

struct BlogImage: Codable {
    let url: String
}
