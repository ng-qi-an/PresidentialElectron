//
//  TanKinLianView.swift
//  Presidential Elections
//
//  Created by Ethan Chow on 26/8/23.
//

import SwiftUI

struct TanKinLianView: View {
    @State private var selectedWoman = "Women 1"
    var womenNames = ["Women 1", "Women 2", "Women 3", "Women 4"]
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                HStack {
                    Text("Nail Nik Nat:")
                        .padding()
                        .font(.largeTitle)
                    Spacer()
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 400, height: 720)
                        .offset(y: 32)
                    Image(selectedWoman)
                        .resizable()
                        .frame(width: 400, height: 659)
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 393, height: 100)
                        .offset(y: 350)
                    Button {
                        selectedWoman = womenNames.randomElement() ?? ""
                        print("Hi!")
                    } label: {
                        Text("0oo")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                            .background(.gray)
                            .
                    }
                }
            }
            .padding()
        }
    }
}

struct TanKinLianView_Previews: PreviewProvider {
    static var previews: some View {
        TanKinLianView()
    }
}
