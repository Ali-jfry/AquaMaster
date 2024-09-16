import SwiftUI

struct DailyFeedLogView: View {
    @StateObject private var viewModel = FeedLogViewModel()
    
    var body: some View {
        ZStack {
            // Background Color or Image
            Color("primaryColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Header
                Text("Today's Feed Log")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("secondaryColor"))
                    .padding(.top)
                
                // Progress Indicator
                ProgressView(value: viewModel.completedFeedings(), total: Double(viewModel.feedLogs.count))
                    .padding(.horizontal)
                    .progressViewStyle(LinearProgressViewStyle(tint: .green))
                
                // Feed Log List
                List {
                    ForEach(viewModel.feedLogs) { log in
                        HStack {
                            Text(log.time)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.toggleFed(for: log)
                                // Haptic feedback
                                let generator = UIImpactFeedbackGenerator(style: .medium)
                                generator.impactOccurred()
                            }) {
                                Image(systemName: log.isFed ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(log.isFed ? .green : .gray)
                                    .font(.system(size: 24))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.vertical, 8)
                    }
                }
                .background(Color("secondaryColor"))
                .listStyle(InsetGroupedListStyle())
                .scrollContentBackground(.hidden)
                .frame(maxHeight: 300)
                .cornerRadius(12)
                
                .padding(.horizontal)
                
                
                // Reset Button
                Button(action: {
                    viewModel.resetFeedLog()
                }) {
                    Text("Reset Feed Log")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
   
}

#Preview {
    DailyFeedLogView()
}
