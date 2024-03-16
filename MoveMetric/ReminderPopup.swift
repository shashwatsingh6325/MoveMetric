import SwiftUI
import UserNotifications

struct ReminderPopup: View {
    
    @Binding var isPresented: Bool
    let exercise: Exercisee
    var reminderAddedAction: ((ExerciseReminder) -> Void)?

    @State private var selectedDays: Set<String> = []
    @State private var selectedTime = Date()
    @State private var reminderTitle: String = ""

    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var body: some View {
        ScrollView{
            VStack {
                Text("Set Reminder")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.top)
                
                TextField("Reminder Title", text: $reminderTitle)
                    .padding(.vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .foregroundColor(.orange)
                
                Divider()
                
                Text("Select days")
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding(.top)
                
                LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading, spacing: 10) {
                    ForEach(daysOfWeek, id: \.self) { day in
                        MultipleSelectionRow(title: day, isSelected: self.selectedDays.contains(day)) {
                            if self.selectedDays.contains(day) {
                                self.selectedDays.remove(day)
                            } else {
                                self.selectedDays.insert(day)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                Text("Select time of day")
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding(.top)
                
                DatePicker("Time", selection: $selectedTime, in: Date()..., displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .frame(width: 280)
                    .padding(.horizontal)
                
                
                
                Button("Set Reminder") {
                    let reminder = ExerciseReminder(title: reminderTitle, exerciseName: exercise.name, daysOfWeek: Array(selectedDays), time: selectedTime)
                    reminderAddedAction?(reminder)
                    scheduleReminderNotifications(reminder) // Schedule local notifications
                    isPresented = false
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(15)
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(20)
            .padding()
            .padding(.bottom, 20)
        }
        .onAppear {
            requestNotificationAuthorization()
        }
    }
    
    private func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted")
            } else if let error = error {
                print("Error requesting notification permission: \(error.localizedDescription)")
            }
        }
    }
    
    private func scheduleReminderNotifications(_ reminder: ExerciseReminder) {
        let content = UNMutableNotificationContent()
        content.title = "Reminder: \(reminder.title)"
        content.body = "Lets go !!! Achieve your fitness goals !!! 🥊 🏃🏻"
        content.sound = .default
        
        let calendar = Calendar.current
        
        for day in reminder.daysOfWeek {
            if let weekday = daysOfWeek.firstIndex(of: day) {
                var dateComponents = DateComponents()
                dateComponents.weekday = weekday + 1
                dateComponents.hour = calendar.component(.hour, from: reminder.time)
                dateComponents.minute = calendar.component(.minute, from: reminder.time)
                dateComponents.second = 0 // Ensure notifications are triggered exactly at the specified time
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                let request = UNNotificationRequest(identifier: "\(reminder.id.uuidString)_\(weekday)", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                    } else {
                        print("Notification scheduled successfully for \(day) at \(dateComponents.hour ?? 0):\(dateComponents.minute ?? 0)")
                    }
                }
            }
        }
    }
}

struct ReminderPopup_Previews: PreviewProvider {
    static var previews: some View {
        ReminderPopup(isPresented: .constant(true), exercise: Exercisee(name: "Sample Exercise", imageName: "exercise_image"))
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(title)
                    .foregroundColor(self.isSelected ? .white : .black)
                Spacer()
                if self.isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.white)
                }
            }
            .padding()
            .foregroundColor(.black)
            .background(self.isSelected ? Color.orange : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.orange, lineWidth: 4)
            )
            .cornerRadius(15) // Rounded corners for the background
        }
        .buttonStyle(PlainButtonStyle()) // Remove button style to prevent default button highlight
    }
}


