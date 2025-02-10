import Foundation

class APIService: ObservableObject {
    @Published var blogPosts: [BlogPost] = []
    
    func fetchPosts() {
        guard let url = URL(string: "http://192.168.1.12:1337/api/blog-posts") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching posts: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response from server")
                return
            }

            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(StrapiResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.blogPosts = decodedResponse.data
                    }
                } catch {
                    print("Decoding error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

// Strapi's API wraps blog posts inside a "data" array
struct StrapiResponse: Codable {
    let data: [BlogPost]
}
