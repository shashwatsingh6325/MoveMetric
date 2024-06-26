import SwiftUI
import AVFoundation

struct WorkoutView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var sessionConfig: SessionConfig
    
    @State var cameraPermissionGranted = false
    
    var body: some View {
        GeometryReader { geometry in
            if cameraPermissionGranted {
                QuickPoseBasicView().environmentObject(viewModel).environmentObject(sessionConfig)
            }
        }.onAppear {
            AVCaptureDevice.requestAccess(for: .video) { accessGranted in
                DispatchQueue.main.async {
                    self.cameraPermissionGranted = accessGranted
                }
            }
        }
    }
}
