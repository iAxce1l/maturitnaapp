import Foundation

class APIService: ObservableObject {
    @Published var blogPosts: [BlogPost] = []
    
    func fetchPosts() {
        guard let url = URL(string: "TUTREBADATURLCKO!!!!") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([BlogPost].self, from: data)
                    DispatchQueue.main.async {
                        self.blogPosts = decodedResponse
                    }
                } catch {
                    print("Daco nejde: \(error)")
                }
            }
        }.resume()
    }
}

