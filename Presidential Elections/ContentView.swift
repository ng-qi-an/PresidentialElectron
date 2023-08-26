//
//  ContentView.swift
//  Presidential Elections
//
//  Created by YJ Soon on 26/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var candidateManager = CandidateManager()
    @State private var showSheet = false
    @State private var showSummary = false
    @State private var newCandidate = Candidate(name: "", picture: "Man", age: 50, hobby: "", race: "", spouse: "", spouseAge: 10, spouseRace: "")
    var body: some View {
        NavigationStack {
            VStack {
                List($candidateManager.candidates, editActions: [.all]) { $candidate in
                    NavigationLink {
                        CandidateDetailView(candidate: $candidate)
                    } label: {
                        HStack {
                            Image(candidate.picture)
                                .resizable()
                                .frame(width: 100, height: 150)
                            VStack(alignment: .leading) {
                                Text(candidate.name)
                                    .font(.system(size: 20))
                                    .padding([.bottom], 2)
                                
                                Text("Age: \(Int(candidate.age))")
                                    .foregroundColor(.gray)
                                Text("Children: \(Int(candidate.children))")
                                    .foregroundColor(.gray)
                            }
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
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        candidateManager.candidates = Candidate.sampleCandidates
                    } label: {
                        Label("Load sample data", systemImage: "clipboard")
                    }

                    Button {
                        showSheet = true
                    } label: {
                        Label("Add person?", systemImage: "plus")
                    }.sheet(isPresented: $showSheet){
                        VStack {
                            Form {
                                Section("Name") {
                                    TextField("Enter name", text: $newCandidate.name)
                                }
                                Section("Details") {
                                    LabeledContent {
                                        TextField("Unknown", text: $newCandidate.race)
                                    } label: {
                                        Text("Race: ")
                                    }
                                    LabeledContent {
                                        TextField("Enter name", text: $newCandidate.hobby)
                                    } label: {
                                        Text("Hobby: ")
                                    }
                                    LabeledContent {
                                        Slider(value: $newCandidate.age, in: 21...99)
                                    } label: {
                                        Text("Age: \(Int(newCandidate.age))")
                                    }
                                    Stepper {
                                        Text("Children: \(newCandidate.children)")
                                    } onIncrement: {
                                        newCandidate.children += 1
                                    } onDecrement: {
                                        newCandidate.children -= 1
                                    }
                                }
                                Button {
                                    candidateManager.candidates.append(newCandidate)
                                    showSheet = false
                                } label: {
                                    Text("Create person")
                                }
                            }
                        }.padding()
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button{
                        candidateManager.candidates = candidateManager.candidates.sorted { $0.votes > $1.votes }
                        showSummary = true
                    } label: {
                        
                        Text("See Vote Summary")
                    }.sheet(isPresented: $showSummary){
                        CandidatesSummaryView()
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
