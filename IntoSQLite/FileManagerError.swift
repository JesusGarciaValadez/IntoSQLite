//
//  FileManagerError.swift
//  IntoSQLite
//
//  Created by Jesus Garcia on 08/09/16.
//  Copyright © 2016 hydrastudio. All rights reserved.
//

import Foundation

enum FileManagerError: Error {
  case CantMoveFileToDocumentsFolder
  case FileDoesntExistsInBundle
  case DocumentsPathIsNil
  case BundlePathIsNil
  case DatabaseAlreadyExistsInDocumentsFolder
}
