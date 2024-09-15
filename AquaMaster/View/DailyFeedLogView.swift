import SwiftUI

struct DailyFeedLogView: View {
    @StateObject private var viewModel = FeedLogViewModel()
    
    var body: some View {
        
        ZStack{
            VStack {
                
                Text("Today's Feed Log")
                    .font(.headline)
                    .padding(.bottom)
                
                List {
                    ForEach(viewModel.feedLogs) { log in
                        HStack {
                            Text(log.time)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.toggleFed(for: log)
                            }) {
                                Image(systemName: log.isFed ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(log.isFed ? .green : .gray)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                // Option to clear or reset the feed log for the day
                Button(action: {
                    resetFeedLog()
                }) {
                    Text("Reset Feed Log")
                        .font(.subheadline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 16)
            }
            .padding()
        }
       
    }
    
    // Reset all feed logs for the day
    private func resetFeedLog() {
        for index in viewModel.feedLogs.indices {
            viewModel.feedLogs[index].isFed = false
        }
        viewModel.saveFeedLogs()
    }
}

#Preview {
    DailyFeedLogView()
}
