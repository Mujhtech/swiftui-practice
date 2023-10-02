//
//  AppwriteService.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import Foundation
import Appwrite
import JSONCodable

class AppwriteService {
    var client: Client
    var account: Account
    var database: Databases
    
    public init() {
        self.client = Client()
            .setEndpoint("https://cloud.appwrite.io/v1")
            .setProject("65184ffdc128a26592ed")
        self.account = Account(client)
        self.database = Databases(client)
    }
    
    public func onRegister(
        _ email: String,
        _ password: String
    ) async throws -> User<[String: AnyCodable]> {
        try await account.create(
            userId: ID.unique(),
            email: email,
            password: password
        )
    }
    
    public func onLogin(
        _ email: String,
        _ password: String
    ) async throws -> Session {
        try await account.createEmailSession(
            email: email,
            password: password
        )
    }
    
    public func onLogout() async throws {
        _ = try await account.deleteSession(
            sessionId: "current"
        )
    }
    
}

