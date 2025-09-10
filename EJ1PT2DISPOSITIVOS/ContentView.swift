import SwiftUI

struct ContentView: View {
    @State private var greenCount = 0
    @State private var redCount = 0
    @State private var orangeCount = 0
    
    var total: Int {
        greenCount + redCount + orangeCount
    }
    
    var body: some View {
        VStack {
            // Círculo amarillo muestra la suma
            CircleCounter(count: total, color: .yellow, isStatic: true)
            
            HStack {
                CircleCounter(count: greenCount, color: .green) {
                    greenCount += 1
                }
                CircleCounter(count: redCount, color: .red) {
                    redCount += 1
                }
                CircleCounter(count: orangeCount, color: .orange) {
                    orangeCount += 1
                }
            }
        }
        .padding()
    }
}

struct CircleCounter: View {
    var count: Int
    var color: Color
    var action: (() -> Void)? = nil
    var isStatic: Bool = false
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(color)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
        }
        .disabled(isStatic) // El amarillo no se puede presionar
    }
}

#Preview {
    ContentView()
}
