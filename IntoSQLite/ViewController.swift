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

    if let carModel = saveCarModel.text, let carPrice = saveCarPrice.text {

      let carPriceInt : Int = Int( carPrice )!
      saveCar( model : carModel, price : carPriceInt )
    }
  }

  @IBAction func searchCarButton(_ sender: AnyObject) {

    if searchCarModel.hasText, let carModel = searchCarModel.text {
      searchCar( model: carModel )
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

