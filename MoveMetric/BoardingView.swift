import SwiftUI

struct BoardingView: View {
    @State private var isShowingReminderPage = false
    
    var body: some View {
        
            NavigationView{
                VStack {
                    VStack {
                        Image("b-img")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height / 3)
                            .padding()
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("MoveMetric")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.orange)
                                .multilineTextAlignment(.center)
                            
                            Text("This app helps you track your exercises and set reminders.")
                                
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: true)
                                .truncationMode(.tail)
                               
                                
                                
                                
                            
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                                    .foregroundColor(.orange)
                                    .padding()
                                //.background(Color.orange)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.orange, lineWidth: 2)
                                    )
                                    .padding(.trailing)
                                
                                Text("Use this button to add new exercises.")
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .truncationMode(.tail)
                            }
                            
                            HStack {
                                Image(systemName: "clock")
                                    .font(.title)
                                    .foregroundColor(.orange)
                                    .padding()
                                //.background(Color.orange)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.orange, lineWidth: 2)
                                    )
                                    .padding(.trailing)
                                
                                Text("Select this option to set reminders for you exercise.")
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .truncationMode(.tail)
                                    .navigationBarBackButtonHidden(true) //
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, -35)
                        
                        
                        Button(action: {
                            isShowingReminderPage = true
                        }) {
                            //                    Text("Continue")
                            //                        .padding()
                            //                        .foregroundColor(.white)
                            //                        .background(Color.orange)
                            //                        .cornerRadius(10)
                        }
                        .padding()
                        
                        NavigationLink(destination: ContentView()) {
                            Text("Continue")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.orange)
                                .cornerRadius(10)
                                .padding(.bottom,50)
                        }
                        .padding()
                        .navigationBarBackButtonHidden(true)
                        
//                        Spacer()
                    }
                    .background(Color.white.edgesIgnoringSafeArea(.all))
                }
                .padding(.top, 50)
            }
            .navigationBarBackButtonHidden()
        }
    }

struct BoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
