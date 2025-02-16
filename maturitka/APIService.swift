import Foundation

// Trieda pre prácu s API, sleduje zmeny pomocou ObservableObject
class APIService: ObservableObject {
    // Published properties, ktoré automaticky aktualizujú UI pri zmene
    @Published var blogPosts: [BlogPost] = []    // Pole blog príspevkov
    @Published var events: [Event] = []          // Pole udalostí
    @Published var novinky: [NovinkyItem] = []   // Pole noviniek

    // Vlastnosti pre pagination
    @Published var currentPage: Int = 1          // Aktuálna stránka
    @Published var totalPages: Int = 1           // Celkový počet stránok
    private let pageSize = 5                     // Počet položiek na stránku

    // Funkcia na načítanie blog príspevkov
    func fetchBlogPosts(page: Int = 1) {
        // URL s parametrami pre pagination a zoradzovanie,?populate=* je nutny na nacitanie obrazkov
        let urlString = "http://192.168.1.12:1337/api/blog-posts?populate=*&pagination[page]=\(page)&pagination[pageSize]=\(pageSize)&sort=createdAt:desc"
        
        // Kontrola platnosti URL
        guard let url = URL(string: urlString) else { return }

        // Vytvorenie a spustenie sieťovej požiadavky
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    // Dekódovanie JSON response
                    let decodedResponse = try JSONDecoder().decode(StrapiResponse.self, from: data)

                    // Aktualizácia UI
                    DispatchQueue.main.async {
                        self.blogPosts = decodedResponse.data
                        self.totalPages = decodedResponse.meta.pagination.pageCount
                        self.currentPage = page
                    }
                } catch {
                    print("❌ Error decoding Blog Posts JSON: \(error)")
                }
            }
        }.resume()
    }

    // Funkcia na načítanie udalostí
    func fetchEvents() {
        let urlString = "http://192.168.1.12:1337/api/events" // URL
        guard let url = URL(string: urlString) else { return }

        // Sieťová požiadavka
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    // Dekódovanie JSON response
                    let decodedResponse = try JSONDecoder().decode(StrapiEventResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.events = decodedResponse.data.map {
                            Event(
                                id: $0.id,
                                title: $0.title,
                                description: $0.description.first?.children.first?.text ?? "No description",
                                date: $0.date
                            )
                        }
                    }
                } catch {
                    print("❌ Error decoding Events JSON: \(error)")
                }
            }
        }.resume()
    }
    
    // Funkcia na načítanie noviniek
    func fetchNovinky() {
        let urlString = "http://192.168.1.12:1337/api/novinkies" // URL
        guard let url = URL(string: urlString) else { return }

        // Sieťová požiadavka
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    // Dekódovanie JSON response
                    let decodedResponse = try JSONDecoder().decode(NovinkyResponse.self, from: data)

                    DispatchQueue.main.async {
                        self.novinky = decodedResponse.data.map {
                            let extractedText = $0.description.first?.children.first?.text ?? "No description"

                            return NovinkyItem(
                                id: $0.id,
                                title: $0.title,
                                description: extractedText
                            )
                        }
                    }
                } catch {
                    print("❌ Error decoding Novinky JSON: \(error)")
                }
            }
        }.resume()
    }
}
