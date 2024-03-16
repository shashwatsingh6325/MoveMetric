import SwiftUI
import UserNotifications

struct MainView: View {
    @State private var reminders: [ExerciseReminder] = []
    @State private var isShowingReminderPopup = false
    @State private var selectedExercise: Exercisee?

    // Key for UserDefaults
    let remindersKey = "Reminders"

    var body: some View {
        NavigationView {
            ZStack {
                // List of reminders
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(reminders.indices, id: \.self) { index in
                            // Reminder Card
                            VStack(alignment: .leading, spacing: 5) {
                                Text(reminders[index].title)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.black)
                                Text("Days: \(reminders[index].formattedDaysOfWeek())") // Display days of the week
                                    .foregroundColor(.black)
                                Text("Time: \(formattedTime(reminders[index].time))")
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(12)
                            .contextMenu {
                                Button(action: {
                                    // Delete button action
                                    reminders.remove(at: index)
                                    saveReminders() // Save reminders after deleting one
                                }) {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
            }
            .navigationBarTitle("Reminders", displayMode: .large)
            .navigationBarItems(trailing:
                Button(action: {
                    isShowingReminderPopup = true
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.orange)
                        .padding(.horizontal, -10)
                }
            )
            .sheet(isPresented: $isShowingReminderPopup) {
                ReminderPopup(isPresented: $isShowingReminderPopup, exercise: selectedExercise ?? Exercisee(name: "", imageName: ""), reminderAddedAction: { reminder in
                    reminders.append(reminder)
                    saveReminders() // Save reminders after adding a new one
                })
            }
            .onAppear {
                loadReminders()
            }
        }
        .background(Color.black)
    }

    func formattedTime(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }

    func loadReminders() {
        if let savedRemindersData = UserDefaults.standard.data(forKey: remindersKey) {
            let decoder = JSONDecoder()
            if let decodedReminders = try? decoder.decode([ExerciseReminder].self, from: savedRemindersData) {
                reminders = decodedReminders
            }
        }
    }

    func saveReminders() {
        let encoder = JSONEncoder()
        if let encodedReminders = try? encoder.encode(reminders) {
            UserDefaults.standard.set(encodedReminders, forKey: remindersKey)
        }
    }
}

struct ReminderPage_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
