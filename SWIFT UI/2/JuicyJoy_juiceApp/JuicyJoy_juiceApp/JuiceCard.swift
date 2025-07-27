import SwiftUI

struct JuiceCard: View {
    let name: String
    let price: String
    let image: String
    let bgColor: Color
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .background(.clear.opacity(0.6))
                    .cornerRadius(30)
            }
            .frame(width: width, height: height)
            .background(bgColor.opacity(0.6))
            .cornerRadius(30)
            .padding(10)
            .overlay(alignment: .bottomTrailing) {
                Rectangle()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.black)
                    .cornerRadius(16)
                    .overlay {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.white)
                    }
            }
            Text(name)
            Text("₹\(price)")
        }
    }
}

#Preview {
    JuiceCard(name: "Mango", price: "100", image: "orangeIMg", bgColor: .green, width: 150, height: 150)
}
