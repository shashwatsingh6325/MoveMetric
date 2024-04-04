import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}



enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case nonbinary = "Non-Binary"
}

struct UserProfileEditingView: View {
  
    @State private var profilePhoto: UIImage?
    @State private var isPickingPhoto = false // State to control the photo picker
    @State private var name = UserDefaults.standard.string(forKey: "name") ?? ""
    @State private var email = UserDefaults.standard.string(forKey: "email") ?? ""
       @State private var phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
    @State private var age = UserDefaults.standard.string(forKey: "age") ?? ""
    @State private var genderIndex = UserDefaults.standard.integer(forKey: "genderIndex")
    @State private var height = UserDefaults.standard.string(forKey: "height") ?? ""
    @State private var weight = UserDefaults.standard.string(forKey: "weight") ?? ""
    @State private var isDataSaved = false

    
    var body: some View {
        VStack(spacing:-10) {
            HStack {
                if let image = profilePhoto {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                }
                Image(systemName: "camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPickingPhoto = true // Activate photo picker
                                    }
                                    .sheet(isPresented: $isPickingPhoto) {
                                        ImagePicker(selectedImage: $profilePhoto)
                                    }
                            }
            

            TextField("Name", text: $name)
                .foregroundColor(.orange)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .disableAutocorrection(true) // Disable autocorrection to avoid keyboard suggestions

            TextField("Age", text: $age)
                .foregroundColor(.orange)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad) // Set keyboard type to number pad for age input

            Picker("Gender", selection: $genderIndex) {
                ForEach(0..<Gender.allCases.count) { index in
                    Text(Gender.allCases[index].rawValue).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .background(.orange.opacity(0))
            .cornerRadius(20)
            TextField("Email", text: $email)
                            .foregroundColor(.orange)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("Phone Number", text: $phoneNumber)
                            .foregroundColor(.orange)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .keyboardType(.phonePad)

            TextField("Height (cm)", text: $height)
                .foregroundColor(.orange)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Weight (kg)", text: $weight)
                .foregroundColor(.orange)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save") {
                // Save profile information
                saveProfile()
                isDataSaved = true
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)

            if isDataSaved {
                Button("Edit") {
                    // Reset isDataSaved flag to allow editing
                    isDataSaved = false
                }
                .padding()
                .background(Color.white)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
        .navigationBarTitle("Edit Profile")
        .onAppear {
            // Load saved data when view appears
            loadSavedData()
        
        }
    }

    func saveProfile() {
        // Save profile information to UserDefaults
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(age, forKey: "age")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
        UserDefaults.standard.set(genderIndex, forKey: "genderIndex")
        UserDefaults.standard.set(height, forKey: "height")
        UserDefaults.standard.set(weight, forKey: "weight")
        
        // Save profile photo to UserDefaults (convert to Data)
        if let imageData = profilePhoto?.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: "profilePhoto")
        }
    }

    func loadSavedData() {
        // Load saved data from UserDefaults
        name = UserDefaults.standard.string(forKey: "name") ?? ""
        age = UserDefaults.standard.string(forKey: "age") ?? ""
        genderIndex = UserDefaults.standard.integer(forKey: "genderIndex")
        height = UserDefaults.standard.string(forKey: "height") ?? ""
        weight = UserDefaults.standard.string(forKey: "weight") ?? ""
        email = UserDefaults.standard.string(forKey: "email") ?? ""
        phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""

        // Load profile photo from UserDefaults (convert from Data)
        if let imageData = UserDefaults.standard.data(forKey: "profilePhoto") {
            profilePhoto = UIImage(data: imageData)
        }
    }
}

//
import SwiftUI

struct UserProfileView: View {
    @State private var name = "John Doe"
       @State private var email = "test@gmail.com"
       @State private var phoneNumber = "9876543210"
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        // Your existing views here
                        VStack {
                            NavigationLink(destination: UserProfileEditingView()) {
                                OptionsView(title: "My Account", icon: "person.crop.circle")
                            }
                            Divider()
                            OptionsView(title: "Favourite Exercise", icon: "heart")
                            Divider()
                            OptionsView(title: "Help Center", icon: "questionmark.circle")
                            Divider()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .padding(.horizontal))
                        .padding(.top,110)
                        
                        // Booking section
                        
                        Button("Delete") {
                            // Perform logout action
                        }
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                    }
                }
                
                // Overlaying ZStack
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.orange) // Use the color you want for the rounded rectangle
                        .frame(height: 220) // Set the height you want for the rounded rectangle
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("John Doe")
                                    .fontWeight(.bold)
                                    .font(.title)
                                
                                HStack(spacing: 2) {
                                    Text("9876543210")
                                    Text(" ")
                                    Text("test@gmail.com")
                                }
                            }
                            Image("vsitup")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 54, height: 54)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top, 120)
                }
                .offset(y: -55)
                .padding(.bottom, 360)
                .edgesIgnoringSafeArea(.top)
                .offset(y: -60)
                
            }
            
        }
        
    }
}

// OptionsView.swift
// No changes needed for OptionsView

// Preview code
// No changes needed for preview code

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
