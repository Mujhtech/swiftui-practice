//
//  HabitModel.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//


import Appwrite
import Foundation



struct HabitModel: Codable, Identifiable {
    let id: String?
    let userId: String
    let title: String
    let description: String?
    let goals: Int?
    let goalCompleted: Int?
    let icon: String
    let startDate: String?
    let endDate: String?
}
