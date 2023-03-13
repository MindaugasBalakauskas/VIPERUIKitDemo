//
//  ViewController.swift
//  VIPERUIKitDemo
//
//  Created by Mindaugas Balakauskas on 31/01/2023.
//
///VIPER
///V - View - Any UI element screen viewcontroller
///I - Interactor - This is bussines logic same as ViewModel
///P - Presenter - Will comunicate with rest of things in VIPER
///E - Entity - Model
///R - Router - Coordinator responsible for navigation logic
///
///

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var presenter: AnyPresenter?
    var productsArray = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productsArray[indexPath.row]
        presenter?.showMeDetailsScreen(data: product)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = productsArray[indexPath.row].title
        return cell
    }
    
    
}

extension ViewController: AnyView {
    
    
    func update(with products: [Product]) {
        DispatchQueue.main.async {
            self.productsArray = products
            self.tableView.reloadData()
        }
        
        print(products)
    }
    
    func update(with error: String) {
        print(error)
    }
    
    
}

