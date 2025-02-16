import SwiftUI

// View pre zobrazenie akcií/aktualít
struct AkcieView: View {
    // Sleduje zmeny v API službe
   @ObservedObject var apiService = APIService()

   // Main view builder
   var body: some View {
       VStack {
           // Header sekcie
           Text("Aktuality")
               .font(.title)
               .fontWeight(.bold)
               .padding(.top)

           // Scrollovateľný kontainer pre novinky
           ScrollView {
               // Vertical stack pre list noviniek
               VStack(spacing: 10) {
                   // Iterujeme cez pole noviniek
                   ForEach(apiService.novinky) { novinka in
                       NovinkyPreview(novinka: novinka)
                   }
               }
               .padding()
           }
       }
       // Lifecycle hook - fetchneme novinky pri zobrazení
       .onAppear {
           apiService.fetchNovinky()
       }
   }
}

// Subview pre preview jednej novinky
struct NovinkyPreview: View {
   // Data model pre novinku
   let novinka: NovinkyItem

   // Environment premenná pre detekciu light/dark módu
   @Environment(\.colorScheme) var colorScheme

   // View builder pre preview novinky
   var body: some View {
       // Vertical stack pre content novinky
       VStack(alignment: .leading, spacing: 5) {
           // Title novinky
           Text(novinka.title)
               .font(.headline)
               .fontWeight(.bold)
               .foregroundColor(Color.primary)

           // Popis novinky
           Text(novinka.description)
               .font(.body)
               .foregroundColor(.secondary)
       }
       .padding()
       .frame(maxWidth: .infinity, alignment: .leading)
       // Dynamické pozadie podľa system theme
       .background(Color(uiColor: .systemBackground))
       .cornerRadius(10)
       // Conditional styling pre dark/light mode
       .overlay(
           RoundedRectangle(cornerRadius: 10)
               .stroke(colorScheme == .dark ? Color.gray.opacity(0.3) : Color.clear, lineWidth: 1)
       )
       .shadow(color: colorScheme == .light ? Color.black.opacity(0.1) : Color.clear, radius: 3)
   }
}

// Preview provider pre SwiftUI canvas
struct AkcieView_Previews: PreviewProvider {
   // Preview v light aj dark móde
   static var previews: some View {
       Group {
           AkcieView()
               .preferredColorScheme(.light)
           AkcieView()
               .preferredColorScheme(.dark)
       }
   }
}
