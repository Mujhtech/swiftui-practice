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
    
    
    public func currentSession() async throws -> User<[String: AnyCodable]> {
        try await account.get()
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
    
    public func getDocs(_ db: Database, _ collection: DatabaseCollections, data: Any) async throws {
        _ = try await database.listDocuments(
            databaseId: db.rawValue,
            collectionId: collection.rawValue
        )
    }
    
    public func insertDoc(_ db: Database, _ collection: DatabaseCollections, data: Any) async throws {
        _ = try await database.createDocument(
            databaseId: db.rawValue,
            collectionId: collection.rawValue,
            documentId: ID.unique(),
            data: data
        )
    }
    
    
    public func updateDoc(_ db: Database, _ collection: DatabaseCollections, _ id: String, data: Any) async throws {
        _ = try await database.updateDocument(
            databaseId: db.rawValue,
            collectionId: collection.rawValue,
            documentId: id,
            data: data
        )
    }
    
    
    public func removeDoc(_ db: Database, _ collection: DatabaseCollections, _ id: String, data: Any) async throws {
        _ = try await database.deleteDocument(
            databaseId: db.rawValue,
            collectionId: collection.rawValue,
            documentId: id
        )
    }
    
}

