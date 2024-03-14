import SwiftUI
import UserNotifications

struct ReminderPopup: View {
    @Binding var isPresented: Bool
    let exercise: Exercisee // Change to Exercisee
    var reminderAddedAction: ((ExerciseReminder) -> Void)?

    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var reminderTitle: String = ""

    var body: some View {
        VStack {
            Text("Set Reminder")
                .font(.title)
                .foregroundColor(.black)
                .padding(.top,130)

            TextField("Reminder Title", text: $reminderTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .foregroundColor(.orange)

            DatePicker("Date", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
               
                .frame(width: 280)
                .padding(.horizontal)
                
                

            DatePicker("Time", selection: $selectedTime, in: Date()..., displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .frame(width: 280)
                .padding(.horizontal)
                
                

            Button("Set Reminder") {
                let reminder = ExerciseReminder(title: reminderTitle, exerciseName: exercise.name, date: selectedDate, time: selectedTime)
                ReminderDatabase.reminders.append(reminder)
                reminderAddedAction?(reminder)
                scheduleReminderNotification(reminder) // Schedule local notification
                isPresented = false
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(15)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding()
        .padding(.bottom,95)
    }

    // Function to schedule local notification
    private func scheduleReminderNotification(_ reminder: ExerciseReminder) {
        let content = UNMutableNotificationContent()
        content.title = "Reminder: \(reminder.title)"
        content.body = "Exercise: \(reminder.exerciseName)"
        content.sound = .default

        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: reminder.date)

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        let request = UNNotificationRequest(identifier: reminder.id.uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
}

struct ReminderPopup_Previews: PreviewProvider {
    static var previews: some View {
        ReminderPopup(isPresented: .constant(true), exercise: Exercisee(name: "Sample Exercise", imageName: "exercise_image"))
    }
}
