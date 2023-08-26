import SwiftUI

struct TharmanView: View {
    @State private var lightness = 0.0
    var body: some View {
        ZStack {
            Color(.lightGray)
                .opacity(0.0)
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Namraht:")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(50)
                
                
                ZStack {
                    Rectangle()
                        .frame(width: 240, height: 299)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    
                    Image("BaldMan")
                        .scaledToFit()
                    Image("BigForehead")
                        .resizable()
                        .frame(width: 140, height: 40)
                        .offset(y: -51)
                        .offset(x: -10)
                        .opacity(lightness)
                }
                Text("Slide to polish head")
                    .padding()
                    .font(.title2)
                Slider (value: $lightness, in: 0...1)
                Text("Opacity of polish: \(Int(lightness))")
            }.padding(30)
        }
    }
}

struct TharmanView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
