//
//  ViewController.swift
//  IntoSQLite
//
//  Created by Jesus Garcia on 06/09/16.
//  Copyright © 2016 hydrastudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var saveCarModel: UITextField!
  @IBOutlet weak var saveCarPrice: UITextField!
  @IBOutlet weak var searchCarModel: UITextField!

  @IBAction func saveCarButton(_ sender: AnyObject) {

    if self.saveCarModel.hasText && self.saveCarPrice.hasText {
      if let carModel = self.saveCarModel.text , let carPrice = Int ( self.saveCarPrice.text! ) {
        self.saveCar( model : carModel, price : carPrice )
      }
    }
  }

  @IBAction func searchCarButton(_ sender: AnyObject) {

    if self.searchCarModel.hasText, let carModel = self.searchCarModel.text {
      self.searchCar( model: carModel )
    }
  }

  func saveCar( model : String, price : Int ) {
    print( "Auto modelo: \(model) guardado con el precio: \(price))" )
  }

  func searchCar( model : String ) {
    print( "Resultado: \(model)" )
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

