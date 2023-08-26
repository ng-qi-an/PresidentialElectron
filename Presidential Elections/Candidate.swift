//
//  Candidate.swift
//  Presidential Elections
//
//  Created by YJ Soon on 26/8/23.
//

import Foundation

struct Candidate: Identifiable, Codable {
    var id = UUID()
    var name: String
    var picture: String
    var age: Double
    var hobby: String
    var children: Int = 0
    var race: String
    var spouse: String
    var spouseAge: Double
    var spouseRace: String
    var votes: Int = 0
}
