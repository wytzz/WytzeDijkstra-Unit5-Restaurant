//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Wytze Dijkstra on 03/12/2018.
//  Copyright © 2018 Wytze Dijkstra. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    @IBAction func addToOrderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    
    
    
    var menuItem : MenuItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        addToOrderButton.layer.cornerRadius = 5.0
        updateUI()
    }
    
    func updateUI() {
    titleLabel.text = menuItem.name
    priceLabel.text = String(format: "$%.2f", menuItem.price)
    detailTextLabel.text = menuItem.detailText
    MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
        guard let image = image else { return }
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    }
}
