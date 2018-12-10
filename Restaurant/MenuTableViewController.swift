//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Wytze Dijkstra on 03/12/2018.
//  Copyright © 2018 Wytze Dijkstra. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var menuItems = [MenuItem]()
    var category: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = category.capitalized
        MenuController.shared.fetchMenuItems(forCategory: category) { (menuItems) in
            if let menuItems = menuItems {
                self.updateUI(with: menuItems)
            }
        }
    }

    func updateUI(with menuItems: [MenuItem]) {
        DispatchQueue.main.async {
            self.menuItems = menuItems
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    } 
 
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format:"$%.2f", menuItem.price)
        cell.detailTextLabel?.lineBreakMode = NSLineBreakMode.byClipping
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.numberOfLines = 0
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell), currentIndexPath != indexPath {
            return
        }
        cell.imageView?.image = image
        cell.setNeedsLayout()
                
    }
}
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuDetailSegue" {
            let menuItemDetailViewController = segue.destination as! MenuItemDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuItemDetailViewController.menuItem = menuItems[index]
        }
    }
}
