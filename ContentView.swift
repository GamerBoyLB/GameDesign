import SwiftUI
struct ContentView: View {
    // Game state
    @State private var currentStep = "summary"
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            switch currentStep {
            case "summary":
                Text(" 🔪 You and your friends were on the way to a college party when suddenly the car breaks down. Your stranded in the middle of nowhere with no service. Before your phone didn't have service the Bay Harbor Butcher a dangerous Serial Killer on the loose and no one knows where he went after killing 20+ people. 🔪")
                    .multilineTextAlignment(.center)
                HStack {
                    gameButton("Start") {
                        currentStep = "start"
                    }
                }
            case "start":
                Text("Your car breaks down and you and your friends are stranded in the middle of nowhere what do you do? ")
                    .multilineTextAlignment(.center)
                HStack {
                    gameButton("Take the path") {
                        currentStep = "path"
                    }
                    gameButton("Stay at the car") {
                        currentStep = "fix"
                    }
                }
            case "path":
                Text(" You want to get food, get gas, or get car towed?")
                    .multilineTextAlignment(.center)
                VStack {
                    gameButton("Get Food") {
                        currentStep = "Get food"
                    }
                    gameButton("Get Gas") {
                        currentStep = "Get Gas"
                    }
                    gameButton("Car Towed") {
                        currentStep = "Get Car Towed"
                    }
                }
            case "fix":
                Text(" You see a human figure that looks like The Bay Harbor Butcher with his little bag of weapons  ")
                Circle()
                    .fill(Color.brown)
                    .frame(width: 100, height: 100)
                gameButton("Run Away") {
                    currentStep = "Run Away"
                }
                gameButton("Defend Yourself") {
                    currentStep = "Defend yourself with a gun"
                }
            case "Run Away":
                Text("It's dark and scary. You run as fast as you can and succesfully escaped The Bay Harbor Butcher's grasp. YOU ESCAPED! 🥳")
                Ellipse()
                    .fill(Color.gray)
                    .frame(width: 120, height: 60)
                gameButton("Defend yourself with a gun") {
                    currentStep = "Defend yourself with a gun"
                }
            case "Defend yourself with a gun":
                Text("You tried to aim and shoot at The Bay Harbor Butcher, but when you tried to shoot THE GUN JAMMED!!! You tried to run away but he caught you and your friends and chopped yall up into pieces and thrown your body into the river with the rest of his other victims.")
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                gameButton("Restart Game") {
                    currentStep = "start"
                }
            case "river":
                Text("🚣 You follow the river and find a boat.")
                Image(systemName: "ferry.fill")
                    .resizable()
                    .frame(width: 80, height: 60)
                    .foregroundColor(.blue)
                gameButton("Sail Away") {
                    currentStep = "start"
                }
            default:
                Text("Game Over.")
            }
            Spacer()
        }
        .padding()
        .font(.title3)
    }
    // Reusable styled button
    func gameButton(_ label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
#Preview {
    ContentView()
}



