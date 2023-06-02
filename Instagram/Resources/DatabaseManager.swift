//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Bhavin's on 01/06/23.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared  = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // Mark: - Public
    
    /// Check if username and email is available
    ///  - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// Insert new user data to database
    ///  - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion: Async callbak for result if database entry succeeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabseKey()
        print(key)
        database.child(email.safeDatabseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // Succeeded
                completion(true)
                return
            }
            else {
                // failed
                completion(false)
                return
            }
        }
    }
}
