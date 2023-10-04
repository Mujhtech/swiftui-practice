//
//  PaginatedData.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 04/10/2023.
//

import Foundation


struct PaginatedData<T: Codable>: Codable {
    let total: Int?
    let items: [T]?
   
    
//    func toHabitList() -> [HabitModel] {
//        let data = items
//        return data?.map( {HabitModel(id: $0.id )} ) ?? []
//    }
}
