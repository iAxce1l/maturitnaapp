import SwiftUI

// Hlavný view pre kalendár
struct KalendarView: View {
   // State premenné pre manažovanie UI stavu
   @State private var selectedDate: Date = Date()
   @State private var currentMonth: Date = Date()
   @State private var showEventAlert: Bool = false
   @State private var selectedEvent: Event?
   
    // Sleduje zmeny v API službe
   @ObservedObject var apiService = APIService()
   
   // Utility properties pre prácu s dátumami
   private let calendar = Calendar.current
   private let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
       formatter.dateFormat = "MMMM yyyy"
       formatter.locale = Locale(identifier: "sk_SK") // Slovenská lokalizácia
       return formatter
   }()
   
   // Konštanty pre dni v týždni
   private let daysOfWeek = ["Ne", "Po", "Ut", "St", "Št", "Pi", "So"]
   
   // Main view builder
   var body: some View {
       VStack(spacing: 20) {
           // Header s navigáciou medzi mesiacmi
           HStack {
               Button(action: previousMonth) {
                   Image(systemName: "chevron.left")
               }
               
               Text(dateFormatter.string(from: currentMonth))
                   .font(.title2)
                   .fontWeight(.bold)
                   .frame(maxWidth: .infinity)
               
               Button(action: nextMonth) {
                   Image(systemName: "chevron.right")
               }
           }
           .padding(.horizontal)
           
           // Riadok s názvami dní
           HStack {
               ForEach(daysOfWeek, id: \.self) { day in
                   Text(day)
                       .frame(maxWidth: .infinity)
                       .font(.caption)
                       .foregroundColor(.gray)
               }
           }
           
           // Grid pre dni v mesiaci
           LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
               ForEach(days(), id: \.self) { date in
                   if let date = date {
                       // Custom view pre jeden deň
                       DayView(date: date, isSelected: calendar.isDate(date, inSameDayAs: selectedDate), hasEvent: isEventDay(date))
                           .onTapGesture {
                               selectedDate = date
                               if let event = eventForDate(date) {
                                   selectedEvent = event
                                   showEventAlert = true
                               }
                           }
                   } else {
                       // Prázdny priestor pre dni mimo aktuálny mesiac
                       Color.clear.frame(height: 40)
                   }
               }
           }
       }
       .padding()
       // Lifecycle hook - načítanie eventov pri zobrazení
       .onAppear {
           apiService.fetchEvents()
       }
       // Alert pre zobrazenie detailu eventu
       .alert(item: $selectedEvent) { event in
           Alert(title: Text(event.title), message: Text(event.description), dismissButton: .default(Text("OK")))
       }
   }
   
   // Helper funkcia pre generovanie dní v mesiaci
   private func days() -> [Date?] {
       let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth))!
       let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
       let numberOfDaysInMonth = calendar.range(of: .day, in: .month, for: currentMonth)?.count ?? 0
       
       var days: [Date?] = Array(repeating: nil, count: firstWeekday - 1)
       
       for day in 1...numberOfDaysInMonth {
           if let date = calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth) {
               days.append(date)
           }
       }
       
       let remainingDays = 42 - days.count // 6 týždňov x 7 dní
       days.append(contentsOf: Array(repeating: nil, count: remainingDays))
       
       return days
   }
   
   // Navigačné funkcie pre mesiace
   private func previousMonth() {
       if let newDate = calendar.date(byAdding: .month, value: -1, to: currentMonth) {
           currentMonth = newDate
       }
   }
   
   private func nextMonth() {
       if let newDate = calendar.date(byAdding: .month, value: 1, to: currentMonth) {
           currentMonth = newDate
       }
   }
   
   // Funkcie pre prácu s eventami, konverzia strapi formátu dátumu na Swift formát
   private func isEventDay(_ date: Date) -> Bool {
       let formatter = DateFormatter()
       formatter.dateFormat = "yyyy-MM-dd"
       let dateString = formatter.string(from: date)
       return apiService.events.contains { $0.date == dateString }
   }
   
   private func eventForDate(_ date: Date) -> Event? {
       let formatter = DateFormatter()
       formatter.dateFormat = "yyyy-MM-dd"
       let dateString = formatter.string(from: date)
       return apiService.events.first { $0.date == dateString }
   }
}

// Subview pre zobrazenie jedného dňa v kalendári
struct DayView: View {
   let date: Date
   let isSelected: Bool
   let hasEvent: Bool
   private let calendar = Calendar.current
   
   var body: some View {
       Text("\(calendar.component(.day, from: date))")
           .frame(height: 40)
           .frame(maxWidth: .infinity)
           // Conditional styling pre rôzne stavy dňa
           .background(hasEvent ? Color.yellow.opacity(0.5) : (isSelected ? Color.blue.opacity(0.3) : Color.clear))
           .clipShape(Circle())
           .foregroundColor(isSelected ? .blue : .primary)
           .overlay(
               Circle()
                   .stroke(hasEvent ? Color.yellow : Color.clear, lineWidth: 2)
           )
   }
}
