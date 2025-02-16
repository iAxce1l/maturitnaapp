import Foundation

// Root API Response
struct StrapiResponse: Codable {
    let data: [BlogPost]
    let meta: MetaData // Meta field na pagination
}

// Blog Post Model
struct BlogPost: Identifiable, Codable {
    let id: Int
    let documentId: String
    let title: String
    let content: [ContentBlock]
    let publishedAt: String
    let image: [BlogImage]?
}

// Content Structure
struct ContentBlock: Codable {
    let type: String
    let children: [ContentText]
}

// Text Content
struct ContentText: Codable {
    let type: String
    let text: String
}

// Image Model
struct BlogImage: Codable {
    let url: String
    let formats: ImageFormats?
}

// Image Sizes
struct ImageFormats: Codable {
    let thumbnail: ImageFormat?
    let small: ImageFormat?
    let medium: ImageFormat?
    let large: ImageFormat?
}

// Image Format
struct ImageFormat: Codable {
    let url: String
    let width: Int
    let height: Int
}

// MetaData na Pagination
struct MetaData: Codable {
    let pagination: Pagination
}

struct Pagination: Codable {
    let page: Int
    let pageSize: Int
    let pageCount: Int
    let total: Int
}
