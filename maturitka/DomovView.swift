import SwiftUI

// Hlavný view pre domovskú obrazovku
struct DomovView: View {
   // StateObject pre API service - zabezpečuje data fetching
   @StateObject private var apiService = APIService()

   // Main view builder
   var body: some View {
       // Navigation wrapper pre push/pop navigáciu
       NavigationView {
           // Vertical stack ako root container
           VStack {
               // Subview pre zobrazenie preview blog postov
               // Injectujeme API service ako dependency
               BlogPostPreviewView(apiService: apiService)
           }
           // Inline style pre navigation bar
           .navigationBarTitleDisplayMode(.inline)
           // Custom toolbar pre header
           .toolbar {
               // Centrovaný title v navigation bare
               ToolbarItem(placement: .principal) {
                   Text("Domov")
                       .font(.largeTitle)
                       .fontWeight(.bold)
                       .frame(maxWidth: .infinity, alignment: .center)
               }
           }
           // Lifecycle hook - fetchneme data pri zobrazení screenu
           .onAppear {
               apiService.fetchBlogPosts()
           }
       }
   }
}
