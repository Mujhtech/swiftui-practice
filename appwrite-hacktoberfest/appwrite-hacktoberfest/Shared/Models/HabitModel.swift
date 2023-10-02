//
//  HabitModel.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import Foundation


struct HabitModel: Codable {
    let id: String
    let title: String
    let description: String
    let goals: Int?
    let repeatTask: String
    let startDate: Date
    let endDate: Date
}
