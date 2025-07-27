import SwiftUI

struct ContentView: View {
    
    @State private var seletedCategory : Int = 1
    @State private var juices2D : [[Juice]] = []
    
    let categories: [String] = ["All",
                                "Juice",
                                "Mojitos",
                                "Shakes"]
    
    let juices: [Juice] = [
        Juice(name: "Mango", price: "100", image: "mango", bgColor: .yellow),
        Juice(name: "Apple", price: "110", image: "apple", bgColor: .red),
        Juice(name: "Orange", price: "120", image: "orange", bgColor: .orange),
        Juice(name: "Grape", price: "130", image: "grape", bgColor: .purple),
        Juice(name: "Watermelon", price: "140", image: "watermelon", bgColor: .green),
        Juice(name: "Pineapple", price: "150", image: "pineapple", bgColor: .yellow),
        Juice(name: "Blueberry", price: "160", image: "blueberry", bgColor: .blue),
        Juice(name: "Strawberry", price: "170", image: "strawberry", bgColor: .pink),
        Juice(name: "Peach", price: "180", image: "peach", bgColor: .orange),
        Juice(name: "Lemon", price: "190", image: "lemon", bgColor: .yellow),
        Juice(name: "Cherry", price: "200", image: "cherry", bgColor: .red),
        Juice(name: "Pear", price: "210", image: "pear", bgColor: .green),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "light.recessed.3.inverse")
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            .padding(.vertical)
            Text("Choose Your Flovor")
                .font(.myFont1)
            Text("Wide range of Fresh and Heathly Jiuces")
                .padding(.bottom)
            
            ScrollView(Axis.Set.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(0..<self.categories.count, id: \.self) { index in
                        
                        let category = self.categories[index]
                        
                        Text("\(category)")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(self.seletedCategory == index ?  .black : .clear)
                            .foregroundStyle(self.seletedCategory == index ?  .white : .black)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .onTapGesture {
                                self.seletedCategory = index
                            }
                    }
                }
            }
            
            GeometryReader { proxy in
                let width = proxy.size.width / 2 - 24
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(0..<self.juices2D.count, id: \.self) { index in
                            
                            let  row = self.juices2D[index]
                            let rowCount = row.count
                            
                            if(rowCount == 2) {
                                HStack {
                                    ForEach(0..<rowCount, id: \.self) { rowIdx in
                                        
                                        let juice1 = row[rowIdx]
                                        
                                        JuiceCard(name: juice1.name, price: juice1.price, image: juice1.image, bgColor: juice1.bgColor, width: width, height: width + 100)
                                    }
                                }
                            }else{
                                let juice1 = row[0]
                                
                                JuiceCard(name: juice1.name, price: juice1.price, image: juice1.image, bgColor: juice1.bgColor, width: width, height: width + 100)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .onAppear{
            self.juices2D = stride(from: 0, to: juices.count, by: 2).map {
                Array(juices[$0..<min($0+2, juices.count)])
            }
        }
    }
}

#Preview {
    ContentView()
}

class Juice {
    let id:  UUID = UUID()
    let name: String
    let price: String
    let image: String
    let bgColor: Color
    
    init(name: String, price: String, image: String, bgColor: Color) {
        self.name = name
        self.price = price
        self.image = image
        self.bgColor = bgColor
    }
}
