import Foundation

struct NovinkyItem: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
}

struct NovinkyResponse: Codable {
    let data: [NovinkyData]
}

struct NovinkyData: Codable {
    let id: Int
    let title: String
    let description: [NovinkyDescription]

    enum CodingKeys: String, CodingKey {
        case id
        case title = "Title"
        case description = "Description"
    }
}

struct NovinkyDescription: Codable {
    let type: String
    let children: [NovinkyText]
}

struct NovinkyText: Codable {
    let type: String
    let text: String
}
