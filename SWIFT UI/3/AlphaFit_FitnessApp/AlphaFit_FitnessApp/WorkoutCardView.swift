import SwiftUI

struct WorkoutCard: View {
    let workoutCardModel: WorkoutCardModel
    var body: some View {
        ZStack {
            Image(workoutCardModel.image)
                .resizable()
                .frame(height: 500)
                .cornerRadius(35)
                .overlay(alignment: .topLeading) {
                    Text(workoutCardModel.skillLevel.rawValue)
                        .bold()
                        .padding(.horizontal, 25)
                        .padding(.vertical)
                        .background(.ultraThinMaterial)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .padding()
                }
                .overlay(alignment: .bottom) {
                    HStack(alignment : .bottom) {
                        VStack(alignment: .leading) {
                            Text(workoutCardModel.workoutType.rawValue)
                                .font(.system(size: 30, weight: .bold,))
                                .foregroundColor(.white)
                            Text(workoutCardModel.workoutdiscription1)
                                .font(.system(size: 20, weight: .bold,))
                                .foregroundColor(.white)
                        }
                        .padding()
                        Spacer()
                        Text(workoutCardModel.duraction)
                            .bold()
                            .padding(.horizontal, 25)
                            .padding(.vertical)
                            .background(.ultraThinMaterial)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .padding()
                    }
                }
                .padding(.horizontal, 25)
        }
        .padding(.vertical, 25)
    }
}

#Preview {
    VStack{
        WorkoutCard(workoutCardModel:WorkoutCardModel(skillLevel: .beginner, duraction: "15 min", image: "Back", workoutdiscription1: "Stretch & Warmup", workoutdiscription2: "Light movement to loosen up.", workoutType: .fullBody))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.red)
}
