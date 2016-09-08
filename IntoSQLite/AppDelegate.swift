//
//  AppDelegate.swift
//  IntoSQLite
//
//  Created by Jesus Garcia on 06/09/16.
//  Copyright © 2016 hydrastudio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func copyDatabaseToDocumentsFolder(database: String) {
    let fileManager = FileManager.default
    let fileHelper  = FileHelper()

    // Move the database to documents folder if there's not there
    if !fileHelper.existsFileInDocumentsFolder(fileName: database)!{

      print("The database doesn't exists in documents folder")

      let pathDatabaseInBundle = fileHelper.getDatabasePathInBundle(databaseName: database)
      let pathDatabaseInDocuments = fileHelper.getPathFromFileInDocumentsFolder(fileName: database)

      do{
        try fileManager.copyItem(atPath: pathDatabaseInBundle!, toPath: pathDatabaseInDocuments!) throws -> FileManagerError
        print("But now there it is! Congratulations!")
      }catch _{
        print("Error: ")
      }
    }else{
      print("The database exists in documents folder! Congratulations!")
    }
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    copyDatabaseToDocumentsFolder(database:"cars")
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

