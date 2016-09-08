//
//  FileHelper.swift
//  IntoSQLite
//
//  Created by Jesus Garcia on 06/09/16.
//  Copyright © 2016 hydrastudio. All rights reserved.
//

import Foundation

class FileHelper {

  let fileManager : FileManager = FileManager.default


  // Returns the path for the documents folder of the app
  func getDocumentsFolderPath() -> String? {

    let documentsFolderPath: String? = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true )[ 0 ]

    print("Documents folder path: \(documentsFolderPath)")

    return documentsFolderPath
  }

  // Returns the complete path of a filename from inside the documents folder
  func getPathFromFileInDocumentsFolder(fileName: String) -> String? {

    let documentsFolderPath: String = getDocumentsFolderPath()!
    let documentsPath: URL = URL(fileURLWithPath: documentsFolderPath)
    let path = documentsPath.appendingPathComponent(fileName)

    print("Database in Documents folder: \(path).sqlite")
    return String(describing: path)
  }

  // Checks if a file exists in the documents directory
  func existsFileInDocumentsFolder(fileName: String) -> Bool? {

    var exists : Bool? = nil
    let path : String? = getPathFromFileInDocumentsFolder(fileName: fileName)!

    if let filePath = path {
      if fileManager.fileExists(atPath: filePath) {
        print("The file \(fileName) exists in the documents folder.");
        exists = true
      }
      else
      {
        print("The file \(fileName) not exists in the documents folder.");
        exists = false
      }
    } else{
      print("There's not a path for file in the documents folder.")
      exists = false
    }

    print("Database \(fileName) exists in Documents folder? \(exists!)")

    return exists
}

  // Get database path in main bundle
  func getDatabasePathInBundle(databaseName: String) -> String? {

    let path = Bundle.main.path(forResource: databaseName, ofType: "sqlite")

    print("Path of the database in Bundle: \(path!)")
    return path
  }


  // Checks if database exists in bundle
  func existsDatabaseInBundle(databaseName: String?) -> Bool? {
    var exists: Bool? = nil

    if let database = databaseName {
      let databasePath: String? = getDatabasePathInBundle( databaseName: database )!

      if databasePath != nil
      {
        print( "The database \(databaseName!) exists in the bundle." )
        exists = true
      }
      else
      {
        print( "The database \(databaseName!) doesn't exist in the bundle." )
        exists = false
      }
    } else {
      print( "The database name's is not defined." )
      exists = false
    }

    print("Database \(databaseName!) exists in Bundle? \(exists!)")
    return exists
  }
}
