//
//  ContentView.swift
//  Presidential Elections
//
//  Created by YJ Soon on 26/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var candidateManager = CandidateManager()
    
    var body: some View {
        NavigationStack {
            VStack {
                List($candidateManager.candidates, editActions: [.all]) { $candidate in
                    NavigationLink {
                        CandidateDetailView(candidate: $candidate)
                    } label: {
                        HStack {
                            Text(candidate.name)
                            Spacer()
                            Text("\(candidate.votes)")
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Election 2023")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        candidateManager.candidates = Candidate.sampleCandidates
                    } label: {
                        Label("Load sample data", systemImage: "clipboard")
                    }
                }
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Label("Add person?", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button{
                                        
                    } label: {
                        Text("See Vote Summary")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
