//
//  CandidateDetailView.swift
//  Presidential Elections
//
//  Created by YJ Soon on 26/8/23.
//

import SwiftUI

struct CandidateDetailView: View {
    
    @Binding var candidate: Candidate
    @StateObject private var candidateManager = CandidateManager()
    var body: some View {
        Form {
            Section("Name") {
                TextField("Enter name", text: $candidate.name)
            }
            Section("Details") {
                LabeledContent {
                    TextField("Unknown", text: $candidate.race)
                } label: {
                  Text("Race: ")
                }
                LabeledContent {
                    TextField("Enter name", text: $candidate.hobby)
                } label: {
                    Text("Hobby: ")
                }
                LabeledContent {
                    Slider(value: $candidate.age, in: 21...99)
                } label: {
                    Text("Age: \(Int(candidate.age))")
                }
                Stepper {
                    Text("Children: \(candidate.children)")
                } onIncrement: {
                    candidate.children += 1
                } onDecrement: {
                    candidate.children -= 1
                }
            }
            Section("Spouse Details") {
                LabeledContent {
                    TextField("Unknown", text: $candidate.spouse)
                } label: {
                  Text("Name: ")
                }
                LabeledContent {
                    TextField("Unknown", text: $candidate.spouseRace)
                } label: {
                  Text("Race: ")
                }
                LabeledContent {
                    Slider(value: $candidate.spouseAge, in: 21...99)
                } label: {
                    Text("Age: \(Int(candidate.spouseAge))")
                }
            }
            Section("Vote here") {
                Stepper {
                    Text("Votes: \(candidate.votes)")
                } onIncrement: {
                    candidate.votes += 1
                } onDecrement: {
                    candidate.votes -= 1
                }
            }
        }
    }
}

struct CandidateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CandidateDetailView(candidate: .constant(Candidate(name: "Male AI", picture: "Man", age: 50, hobby: "Running for president", race: "AI", spouse: "Female AI", spouseAge: 10, spouseRace: "AI")))
    }
}
