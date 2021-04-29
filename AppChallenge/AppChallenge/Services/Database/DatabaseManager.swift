//
//  PersistentService.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/29/21.
//

import Foundation

import Foundation
import SQLite3

protocol DatabaseManagerType {
  
  func insert(id: Int, username: String, password: String)
  func read() -> [Person]
  func deleteByID(id: Int)
}

class DatabaseManager: DatabaseManagerType {
  
  let databasePath: String = "myDb.sqlite"
  var database: OpaquePointer?
  
  init() {
    database = openDatabase()
    createTable()
  }
  
  func openDatabase() -> OpaquePointer? {
    let fileURL = try! FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
      .appendingPathComponent(databasePath)
    
    var database: OpaquePointer? = nil
    
    guard sqlite3_open(fileURL.path, &database) != SQLITE_OK else {
      return database
    }
    
    return nil
  }
  
  func createTable() {
    let createTableString = "CREATE TABLE IF NOT EXISTS person(Id INTEGER PRIMARY KEY,username TEXT,password TEXT);"
    var createTableStatement: OpaquePointer? = nil
    
    guard sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK else {
      sqlite3_finalize(createTableStatement)
      return
    }
    
    if sqlite3_step(createTableStatement) == SQLITE_DONE {
      print("person table created.")
    } else {
      print("person table could not be created.")
    }
    sqlite3_finalize(createTableStatement)
  }
  
  
  func insert(id: Int, username: String, password: String) {
    let persons = read()
    
    for p in persons {
      if p.id == id { return }
    }
    
    let insertStatementString = "INSERT INTO person (Id, username, password) VALUES (NULL, ?, ?);"
    var insertStatement: OpaquePointer? = nil
    
    guard sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK else {
      sqlite3_finalize(insertStatement)
      return
    }
    
    sqlite3_bind_text(insertStatement, 1, (username as NSString).utf8String, -1, nil)
    sqlite3_bind_text(insertStatement, 2, (password as NSString).utf8String, -1, nil)
    
    if sqlite3_step(insertStatement) == SQLITE_DONE {
      print("Successfully inserted row.")
    } else {
      print("Could not insert row.")
    }
    
    sqlite3_finalize(insertStatement)
  }
  
  func read() -> [Person] {
    let queryStatementString = "SELECT * FROM person;"
    var queryStatement: OpaquePointer? = nil
    var psns : [Person] = []
    
    guard sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK else {
      sqlite3_finalize(queryStatement)
      return psns
    }
    
    while sqlite3_step(queryStatement) == SQLITE_ROW {
      let id = sqlite3_column_int(queryStatement, 0)
      let username = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
      let password = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))

      psns.append(Person(id: Int(id), username: username, password: password))
      print("Query Result:")
      print("\(id) | \(username) | \(password)")
    }
    
    sqlite3_finalize(queryStatement)
    return psns
  }
  
  func deleteByID(id: Int) {
    let deleteStatementStirng = "DELETE FROM person WHERE Id = ?;"
    var deleteStatement: OpaquePointer? = nil
    
    guard sqlite3_prepare_v2(database, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK else {
      sqlite3_finalize(deleteStatement)
      return
    }
    
    sqlite3_bind_int(deleteStatement, 1, Int32(id))
    if sqlite3_step(deleteStatement) == SQLITE_DONE {
      print("Successfully deleted row.")
    } else {
      print("Could not delete row.")
    }
    
    sqlite3_finalize(deleteStatement)
  }
  
}


