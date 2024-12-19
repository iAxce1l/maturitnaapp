import SwiftUI
import ElegantCalendar

struct KalendarView: View {
    static let startDate = Date().startOfYear
    static let endDate = Date().endOfYear
    
    @StateObject private var calendarManager: MonthlyCalendarManager
    
    init() {
        let configuration = CalendarConfiguration(
            startDate: Self.startDate,
            endDate: Self.endDate
        )
        _calendarManager = StateObject(
            wrappedValue: MonthlyCalendarManager(
                configuration: configuration,
                initialMonth: Date()
            )
        )
    }
    
    var body: some View {
        MonthlyCalendarView(calendarManager: calendarManager)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                calendarManager.delegate = nil
            }
    }
}


extension Date {
    var startOfYear: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        return calendar.date(from: components) ?? self
    }
    
    var endOfYear: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year], from: self)
        components.year! += 1
        components.second = -1
        return calendar.date(from: components) ?? self
    }
}

struct CalendarEvent: Identifiable {
    let id: String
    let date: Date
    let title: String
    let description: String
}

struct KalendarView_Previews: PreviewProvider {
    static var previews: some View {
        KalendarView()
    }
}

// MARK: - TODO strapi implementacia
extension KalendarView: MonthlyCalendarDelegate {
    func calendar(didSelectDay date: Date) {
        print("Selected date: \(date)")

    }
    
    func calendar(willDisplay month: Date) {
        print("Will display month: \(month)")
    }
    
    func calendar(didSelectMonth month: Date) {
        print("Selected month: \(month)")
    }
}
