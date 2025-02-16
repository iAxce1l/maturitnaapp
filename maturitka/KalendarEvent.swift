import Foundation

struct Event: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let date: String  
}

struct StrapiEventResponse: Codable {
    let data: [EventData]
}

struct EventData: Codable {
    let id: Int
    let documentId: String?
    let title: String
    let description: [EventDescription]
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case documentId
        case title = "Title"
        case description = "Description"
        case date = "Date"
    }
}

struct EventDescription: Codable {
    let type: String
    let children: [EventText]
}

struct EventText: Codable {
    let type: String
    let text: String
}
