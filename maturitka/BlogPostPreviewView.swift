import SwiftUI

// View komponent pre zobrazenie náhľadu príspevkov
struct BlogPostPreviewView: View {
   // Sleduje zmeny v API službe
   @ObservedObject var apiService: APIService
   
   var body: some View {
       VStack {
           // Zoznam  príspevkov
           List(apiService.blogPosts) { post in
               // Navigačný odkaz na detail príspevku
               NavigationLink(destination: BlogDetailView(post: post)) {
                   VStack(alignment: .leading) {
                       // Zobrazenie náhľadového obrázka
                       if let imageUrl = post.image?.first?.formats?.thumbnail?.url {
                           // Asynchrónne načítanie obrázka
                           AsyncImage(url: URL(string: "http://192.168.1.12:1337" + imageUrl)) { image in
                               image.resizable()
                                   .scaledToFit()
                                   .frame(maxWidth: .infinity, maxHeight: 200)
                                   .cornerRadius(10)
                           } placeholder: {
                               // Placeholder počas načítavania
                               Color.gray.opacity(0.3)
                                   .frame(height: 200)
                                   .cornerRadius(10)
                           }
                       }

                       // Nadpis príspevku
                       Text(post.title)
                           .font(.headline)
                           .padding(.top, 5)
                   }
               }
           }

           // Ovládacie prvky paginationu
           HStack {
               // Tlačidlo pre predchádzajúcu stránku
               Button(action: {
                   if apiService.currentPage > 1 {
                       apiService.fetchBlogPosts(page: apiService.currentPage - 1)
                   }
               }) {
                   Text("⬅️ Predošlá")
                       .padding()
                       .background(apiService.currentPage > 1 ? Color.blue : Color.gray)
                       .foregroundColor(.white)
                       .cornerRadius(8)
               }
               .disabled(apiService.currentPage <= 1)

               Spacer()

               // Zobrazenie aktuálnej stránky
               Text("Strana \(apiService.currentPage) z \(apiService.totalPages)")
                   .font(.caption)

               Spacer()

               // Tlačidlo pre ďalšiu stránku
               Button(action: {
                   if apiService.currentPage < apiService.totalPages {
                       apiService.fetchBlogPosts(page: apiService.currentPage + 1)
                   }
               }) {
                   Text("Ďalšia ➡️")
                       .padding()
                       .background(apiService.currentPage < apiService.totalPages ? Color.blue : Color.gray)
                       .foregroundColor(.white)
                       .cornerRadius(8)
               }
               .disabled(apiService.currentPage >= apiService.totalPages)
           }
           .padding()
       }
       // Lifecycle hook - fetchneme data pri zobrazení screenu
       .onAppear {
           apiService.fetchBlogPosts()
       }
   }
}
