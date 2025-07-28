import Foundation

struct WorkoutCardModel {
    let id: UUID = UUID()
    let skillLevel: SkillLevel
    let duraction: String
    let image: String
    let workoutdiscription1: String
    let workoutdiscription2: String
    let workoutType: WorkoutType
}

enum SkillLevel: String {
    case beginner = "Beginner", intermediate = "Intermediate", advance = "Advance"
}

enum WorkoutType : String, CaseIterable {
    case all = "All",
         fullBody = "Full Body",
         leg = "Leg",
         chest = "Chest",
         back = "Back",
         shoulders = "Shoulders",
         biceps = "Biceps",
         triceps = "Triceps"
    
}
