//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Wytze Dijkstra on 10/12/2018.
//  Copyright © 2018 Wytze Dijkstra. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    
    var minutes: Int!

    override func viewDidLoad() {
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
