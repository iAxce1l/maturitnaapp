import Foundation

struct BlogPost: Identifiable, Codable {
    let id: Int
    let title: String
    let content: String
    let image_url: String
}
