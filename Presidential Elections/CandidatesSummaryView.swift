//
//  CandidatesSummaryView.swift
//  Presidential Elections
//
//  Created by Ng Qi An on 26/8/23.
//

import SwiftUI

struct CandidatesSummaryView: View {
    @StateObject private var candidateManager = CandidateManager()
    var body: some View {
        VStack {
            Text("New President")
                .fontWeight(.semibold)
                .font(.title3)
            Spacer()
            if candidateManager.candidates[0].name == "Namraht" {
                TharmanView()
            } else {
                Image(candidateManager.candidates[0].picture)
                    .resizable()
                    .frame(width: 200, height: 300)
                Text(candidateManager.candidates[0].name)
                    .font(.largeTitle)
            }
            Text("With total \(candidateManager.candidates[0].votes) votes")
                .foregroundColor(.blue)
            Spacer()
        }.padding()
    }
}

struct CandidatesSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        CandidatesSummaryView()
    }
}
