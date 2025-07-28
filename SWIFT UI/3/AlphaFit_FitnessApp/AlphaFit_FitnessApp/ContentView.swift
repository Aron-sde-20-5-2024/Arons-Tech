import SwiftUI

struct ContentView: View {
    @State private var seletedWorkoutType : WorkoutType = .all
    private let workoutCardModels: [WorkoutCardModel] = [
        WorkoutCardModel(skillLevel: .beginner, duraction: "15 min", image: "full_body", workoutdiscription1: "Stretch & Warmup", workoutdiscription2: "Light movement to loosen up.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "20 min", image: "back", workoutdiscription1: "Core Stability", workoutdiscription2: "Engage your core muscles.", workoutType: .back),
        WorkoutCardModel(skillLevel: .advance, duraction: "30 min", image: "leg", workoutdiscription1: "Leg Strength", workoutdiscription2: "Build explosive power.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .beginner, duraction: "10 min", image: "chest", workoutdiscription1: "Chest Basics", workoutdiscription2: "Focus on upper chest activation.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "25 min", image: "back", workoutdiscription1: "Back Burn", workoutdiscription2: "Target lats and traps.", workoutType: .back),
        WorkoutCardModel(skillLevel: .advance, duraction: "35 min", image: "leg", workoutdiscription1: "Leg Day Extreme", workoutdiscription2: "Push your lower body to the limit.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .beginner, duraction: "18 min", image: "biceps", workoutdiscription1: "Biceps Blast", workoutdiscription2: "Beginner arm toning.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "22 min", image: "shoulder", workoutdiscription1: "Shoulder Stability", workoutdiscription2: "Improve posture & support.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .advance, duraction: "28 min", image: "chest", workoutdiscription1: "Chest Sculpt", workoutdiscription2: "Intense upper body push.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .beginner, duraction: "12 min", image: "back", workoutdiscription1: "Back Activation", workoutdiscription2: "Build foundational strength.", workoutType: .back),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "24 min", image: "full_body", workoutdiscription1: "Full Body Pump", workoutdiscription2: "Balanced strength workout.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .advance, duraction: "40 min", image: "shoulder", workoutdiscription1: "Shoulder Builder", workoutdiscription2: "Heavy delt work.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .beginner, duraction: "16 min", image: "biceps", workoutdiscription1: "Biceps Basics", workoutdiscription2: "Start shaping your arms.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "26 min", image: "leg", workoutdiscription1: "Leg Sculpt", workoutdiscription2: "Tone & strengthen legs.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .advance, duraction: "33 min", image: "back", workoutdiscription1: "Back Beast Mode", workoutdiscription2: "Advanced pulls and rows.", workoutType: .back),
        WorkoutCardModel(skillLevel: .beginner, duraction: "14 min", image: "shoulder", workoutdiscription1: "Shoulder Primer", workoutdiscription2: "Get ready for overhead lifts.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "27 min", image: "full_body", workoutdiscription1: "Upper Body Split", workoutdiscription2: "Chest, back, shoulders combo.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .advance, duraction: "38 min", image: "leg", workoutdiscription1: "Leg Destroyer", workoutdiscription2: "Super set heavy squats.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .beginner, duraction: "13 min", image: "full_body", workoutdiscription1: "Full Body Intro", workoutdiscription2: "Perfect for first-timers.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "30 min", image: "chest", workoutdiscription1: "Chest & Biceps", workoutdiscription2: "Push & pull synergy.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .beginner, duraction: "17 min", image: "chest", workoutdiscription1: "Chest Opener", workoutdiscription2: "Loosen tight chest muscles.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "21 min", image: "biceps", workoutdiscription1: "Biceps Boost", workoutdiscription2: "Add volume to your arms.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .advance, duraction: "36 min", image: "back", workoutdiscription1: "Advanced Pull", workoutdiscription2: "For serious strength gains.", workoutType: .back),
        WorkoutCardModel(skillLevel: .beginner, duraction: "19 min", image: "shoulder", workoutdiscription1: "Shoulder Stability", workoutdiscription2: "Joint prep & control.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "20 min", image: "full_body", workoutdiscription1: "Body Burn", workoutdiscription2: "Full body HIIT blast.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .advance, duraction: "32 min", image: "chest", workoutdiscription1: "Chest Warrior", workoutdiscription2: "Max bench reps & sets.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .beginner, duraction: "14 min", image: "leg", workoutdiscription1: "Leg Day Prep", workoutdiscription2: "Mobility and activation.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "23 min", image: "biceps", workoutdiscription1: "Arm Hypertrophy", workoutdiscription2: "Pump those curls.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .advance, duraction: "34 min", image: "shoulder", workoutdiscription1: "Overhead Domination", workoutdiscription2: "Heavy shoulder presses.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .beginner, duraction: "11 min", image: "back", workoutdiscription1: "Back Basics", workoutdiscription2: "Start your pulling journey.", workoutType: .back),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "28 min", image: "chest", workoutdiscription1: "Upper Pump", workoutdiscription2: "Chest & shoulder combo.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .advance, duraction: "37 min", image: "leg", workoutdiscription1: "Quad Quake", workoutdiscription2: "Destroy leg plateaus.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .beginner, duraction: "10 min", image: "shoulder", workoutdiscription1: "Shoulder Ease", workoutdiscription2: "Low impact movements.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "26 min", image: "back", workoutdiscription1: "Row Mastery", workoutdiscription2: "Perfect your form.", workoutType: .back),
        WorkoutCardModel(skillLevel: .advance, duraction: "39 min", image: "biceps", workoutdiscription1: "Biceps Max", workoutdiscription2: "Massive pump guaranteed.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .beginner, duraction: "16 min", image: "full_body", workoutdiscription1: "Total Warmup", workoutdiscription2: "Get moving safely.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "31 min", image: "leg", workoutdiscription1: "Leg Flow", workoutdiscription2: "Mobility + strength.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .advance, duraction: "45 min", image: "full_body", workoutdiscription1: "Alpha Burnout", workoutdiscription2: "No-muscle-left-behind.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .beginner, duraction: "12 min", image: "biceps", workoutdiscription1: "Arms Starter", workoutdiscription2: "Easy entry to arm training.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "29 min", image: "shoulder", workoutdiscription1: "Delts Defined", workoutdiscription2: "High volume overheads.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .advance, duraction: "41 min", image: "back", workoutdiscription1: "Lat Builder", workoutdiscription2: "Wider, thicker back gains.", workoutType: .back),
        WorkoutCardModel(skillLevel: .beginner, duraction: "15 min", image: "leg", workoutdiscription1: "Step & Stretch", workoutdiscription2: "Light lower body toning.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "22 min", image: "chest", workoutdiscription1: "Push Circuit", workoutdiscription2: "Mix reps for muscle confusion.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .advance, duraction: "35 min", image: "biceps", workoutdiscription1: "Biceps Smash", workoutdiscription2: "Advanced arm workout.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .beginner, duraction: "13 min", image: "shoulder", workoutdiscription1: "Prehab Shoulders", workoutdiscription2: "Stabilize and protect.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "33 min", image: "full_body", workoutdiscription1: "Power Combo", workoutdiscription2: "Top-to-bottom strength.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .advance, duraction: "44 min", image: "chest", workoutdiscription1: "Explosive Chest", workoutdiscription2: "Max out on presses.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .beginner, duraction: "20 min", image: "back", workoutdiscription1: "Healthy Spine", workoutdiscription2: "Posture improvement drills.", workoutType: .back),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "25 min", image: "shoulder", workoutdiscription1: "Shoulder Shred", workoutdiscription2: "Finish with fire.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .advance, duraction: "42 min", image: "leg", workoutdiscription1: "Leg Punisher", workoutdiscription2: "Brutal lower body work.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .beginner, duraction: "13 min", image: "chest", workoutdiscription1: "Chest Awakening", workoutdiscription2: "Gentle push routines.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "30 min", image: "back", workoutdiscription1: "Upper Pull Focus", workoutdiscription2: "Lats and rhomboid training.", workoutType: .back),
        WorkoutCardModel(skillLevel: .advance, duraction: "46 min", image: "shoulder", workoutdiscription1: "Shoulder Domination", workoutdiscription2: "Mass-building delts.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .beginner, duraction: "18 min", image: "biceps", workoutdiscription1: "Toned Arms", workoutdiscription2: "Light curls and contractions.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "24 min", image: "full_body", workoutdiscription1: "Balance Burner", workoutdiscription2: "Improve coordination & strength.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .advance, duraction: "50 min", image: "chest", workoutdiscription1: "Beast Chest Day", workoutdiscription2: "Super sets for volume.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .beginner, duraction: "16 min", image: "shoulder", workoutdiscription1: "Delt Prep", workoutdiscription2: "Loosen up the shoulders.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "32 min", image: "biceps", workoutdiscription1: "Intermediate Arms", workoutdiscription2: "Pump & stretch combo.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .advance, duraction: "38 min", image: "back", workoutdiscription1: "Ripped Rows", workoutdiscription2: "Advanced rowing variations.", workoutType: .back),
        WorkoutCardModel(skillLevel: .beginner, duraction: "12 min", image: "leg", workoutdiscription1: "Quick Legs", workoutdiscription2: "No equipment leg day.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "35 min", image: "shoulder", workoutdiscription1: "Volcanic Delts", workoutdiscription2: "Intermediate shoulder burn.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .advance, duraction: "52 min", image: "full_body", workoutdiscription1: "Total Annihilation", workoutdiscription2: "Only for serious lifters.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .beginner, duraction: "15 min", image: "biceps", workoutdiscription1: "Curl It Up", workoutdiscription2: "Simple bicep drills.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "28 min", image: "leg", workoutdiscription1: "Athletic Legs", workoutdiscription2: "Explosiveness and mobility.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .advance, duraction: "48 min", image: "back", workoutdiscription1: "Deadlift Supremacy", workoutdiscription2: "Max tension pulling workout.", workoutType: .back),
        WorkoutCardModel(skillLevel: .beginner, duraction: "14 min", image: "chest", workoutdiscription1: "Push Power Intro", workoutdiscription2: "Push-ups made fun.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "31 min", image: "full_body", workoutdiscription1: "Sweat Mode", workoutdiscription2: "Challenge your entire body.", workoutType: .fullBody),
        WorkoutCardModel(skillLevel: .advance, duraction: "40 min", image: "biceps", workoutdiscription1: "Heavy Arm Day", workoutdiscription2: "Barbell and dumbbell curls.", workoutType: .biceps),
        WorkoutCardModel(skillLevel: .beginner, duraction: "11 min", image: "shoulder", workoutdiscription1: "Easy Delt Day", workoutdiscription2: "Front, side & rear work.", workoutType: .shoulders),
        WorkoutCardModel(skillLevel: .intermediate, duraction: "27 min", image: "chest", workoutdiscription1: "Push Progress", workoutdiscription2: "Get that pec pump.", workoutType: .chest),
        WorkoutCardModel(skillLevel: .advance, duraction: "42 min", image: "leg", workoutdiscription1: "Elite Quads & Hams", workoutdiscription2: "Mass-builder day.", workoutType: .leg),
        WorkoutCardModel(skillLevel: .beginner, duraction: "17 min", image: "back", workoutdiscription1: "Intro Pull Day", workoutdiscription2: "Lighter resistance exercises.", workoutType: .back),
        WorkoutCardModel(skillLevel: .beginner, duraction: "15 min", image: "full_body", workoutdiscription1: "Full Body Warmup", workoutdiscription2: "Loosen up from head to toe.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .beginner, duraction: "12 min", image: "full_body", workoutdiscription1: "Body Basics", workoutdiscription2: "Light stretches and mobility.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .beginner, duraction: "10 min", image: "full_body", workoutdiscription1: "Get Moving", workoutdiscription2: "Beginner-friendly circuit.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .beginner, duraction: "14 min", image: "full_body", workoutdiscription1: "Intro Burn", workoutdiscription2: "Slow-paced bodyweight routine.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "25 min", image: "full_body", workoutdiscription1: "Strength Builder", workoutdiscription2: "Focus on compound lifts.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "28 min", image: "full_body", workoutdiscription1: "Core & More", workoutdiscription2: "Full-body with core focus.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "22 min", image: "full_body", workoutdiscription1: "Sweat Session", workoutdiscription2: "Moderate HIIT.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "30 min", image: "full_body", workoutdiscription1: "Full Body Circuit", workoutdiscription2: "Intense and balanced.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .advance, duraction: "40 min", image: "full_body", workoutdiscription1: "Full Blast", workoutdiscription2: "High intensity intervals.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .advance, duraction: "38 min", image: "full_body", workoutdiscription1: "Explosive Power", workoutdiscription2: "Focus on strength & speed.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .advance, duraction: "42 min", image: "full_body", workoutdiscription1: "Endurance Grind", workoutdiscription2: "Push through limits.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .advance, duraction: "45 min", image: "full_body", workoutdiscription1: "Ultimate Body Test", workoutdiscription2: "Advanced compound sets.", workoutType: .fullBody),
            WorkoutCardModel(skillLevel: .beginner, duraction: "12 min", image: "leg", workoutdiscription1: "Leg Day Starter", workoutdiscription2: "Gentle squats & stretches.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .beginner, duraction: "14 min", image: "leg", workoutdiscription1: "Legs Light", workoutdiscription2: "Activate quads and calves.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .beginner, duraction: "13 min", image: "leg", workoutdiscription1: "Leg Basics", workoutdiscription2: "Mobility & control drills.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .beginner, duraction: "15 min", image: "leg", workoutdiscription1: "Intro Lower Body", workoutdiscription2: "Simple glute work.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "26 min", image: "leg", workoutdiscription1: "Leg Sculpt", workoutdiscription2: "Tone and define legs.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "28 min", image: "leg", workoutdiscription1: "Power Legs", workoutdiscription2: "Drive and control.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "30 min", image: "leg", workoutdiscription1: "Glutes & Hamstrings", workoutdiscription2: "Shape lower body.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "25 min", image: "leg", workoutdiscription1: "Athletic Lower Body", workoutdiscription2: "Speed & jump drills.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .advance, duraction: "40 min", image: "leg", workoutdiscription1: "Leg Destroyer", workoutdiscription2: "Heavy squats and lunges.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .advance, duraction: "42 min", image: "leg", workoutdiscription1: "Leg Volume Max", workoutdiscription2: "High-rep burnout.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .advance, duraction: "38 min", image: "leg", workoutdiscription1: "Explosive Legs", workoutdiscription2: "Plyometric combos.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .advance, duraction: "45 min", image: "leg", workoutdiscription1: "Leg Endurance", workoutdiscription2: "No rest monster set.", workoutType: .leg),
            WorkoutCardModel(skillLevel: .beginner, duraction: "10 min", image: "chest", workoutdiscription1: "Push Start", workoutdiscription2: "Light chest presses.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .beginner, duraction: "12 min", image: "chest", workoutdiscription1: "Chest Basics", workoutdiscription2: "Intro push-ups & flies.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .beginner, duraction: "13 min", image: "chest", workoutdiscription1: "Upper Body Focus", workoutdiscription2: "Simple chest drills.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .beginner, duraction: "15 min", image: "chest", workoutdiscription1: "Activation Chest", workoutdiscription2: "Muscle engagement focus.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "22 min", image: "chest", workoutdiscription1: "Chest Shaper", workoutdiscription2: "Pec fly & incline presses.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "25 min", image: "chest", workoutdiscription1: "Push Circuit", workoutdiscription2: "Bodyweight + dumbbells.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "28 min", image: "chest", workoutdiscription1: "Mass Chest", workoutdiscription2: "Controlled tempo lifts.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .intermediate, duraction: "26 min", image: "chest", workoutdiscription1: "Push & Power", workoutdiscription2: "Chest & triceps mix.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .advance, duraction: "35 min", image: "chest", workoutdiscription1: "Chest Volume Day", workoutdiscription2: "Incline, flat & dips.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .advance, duraction: "38 min", image: "chest", workoutdiscription1: "Pec Pump Extreme", workoutdiscription2: "Chest-focused supersets.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .advance, duraction: "40 min", image: "chest", workoutdiscription1: "Iron Chest", workoutdiscription2: "Barbell dominant day.", workoutType: .chest),
            WorkoutCardModel(skillLevel: .advance, duraction: "42 min", image: "chest", workoutdiscription1: "Explosive Push", workoutdiscription2: "Plyo push-up focus.", workoutType: .chest)
    ]
    
    @State private var filteredWorkoutModels: [WorkoutCardModel] = []
    
    var body: some View {
        VStack {
            HStack() {
                VStack(alignment: .leading) {
                    Text(Constants.Choose)
                        .font(.system(size: 60, weight: .bold,))
                        .foregroundStyle(.white)
                    Text(Constants.aWorkout)
                        .font(.system(size: 50, weight: .bold,))
                        .foregroundColor(Constants.aWorkoutTextFgColor)
                }
                Spacer()
                Image(systemName: "circle.grid.2x2.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 80, height: 80)
                    .background(.ultraThinMaterial)
                    .cornerRadius(40)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(WorkoutType.allCases,id: \.self){ workoutType in
                        
                        let isSelected = self.seletedWorkoutType == workoutType
                        
                        Text(workoutType.rawValue)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 10)
                            .bold()
                            .background(isSelected ?  .white : Constants.unSelectedWorkoutTypeBgColor )
                            .foregroundStyle(isSelected ?  .black : .white)
                            .cornerRadius(20)
                            .padding(.horizontal, 0)
                            .onTapGesture {
                                self.seletedWorkoutType = workoutType
                                self.filterSelectedWorkoutType()
                            }
                    }
                }
            }
            .padding(.leading)
            .padding(.bottom)
            
            if(filteredWorkoutModels.isEmpty) {
                Text(Constants.noVideoFound)
                    .foregroundColor(.white)
                    .frame(maxHeight: .infinity)
            }else{
                ScrollView(showsIndicators: false){
                    ForEach(0..<filteredWorkoutModels.count, id: \.self) { index in
                        let filteredWorkoutCardModel = self.filteredWorkoutModels[index]
                        
                        WorkoutCard(workoutCardModel: filteredWorkoutCardModel)
                    }
                }
            }
        }
        .onAppear {
            self.filterSelectedWorkoutType()
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Constants.bgColor)
    }
    
    private func filterSelectedWorkoutType() {
        if self.seletedWorkoutType == .all {
            self.filteredWorkoutModels = self.workoutCardModels
        } else {
            self.filteredWorkoutModels = self.workoutCardModels.filter {
                $0.workoutType == self.seletedWorkoutType
            }
        }
    }
}

#Preview {
    ContentView()
}
