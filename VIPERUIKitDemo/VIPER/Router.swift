//
//  Router.swift
//  VIPERUIKitDemo
//
//  Created by Mindaugas Balakauskas on 31/01/2023.
//

import Foundation
import UIKit

typealias EntryPoint = UIViewController & AnyView
protocol AnyRouter {
    //var presenter: AnyPresenter? {get set}
    var entry: EntryPoint? {get}
    static func start() -> AnyRouter
    func moveToDetailsScreen(data: Product)
}

class ProductsRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = ProductsRouter()
        //Assign VIP
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        var view: AnyView = viewController
        var intreactor: AnyInteractor = ProductsInteractor()
        var presenter: AnyPresenter = ProductsPresenter()
        
        view.presenter = presenter
        intreactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = intreactor
        presenter.router = router
        
        router.entry = view as? EntryPoint
        return router
    }
    
    func moveToDetailsScreen(data: Product) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyboard.instantiateViewController (withIdentifier:
        "DetailsViewController") as! DetailsViewController
        detailsViewController.someProduct = data
        entry?.navigationController?.pushViewController(detailsViewController, animated:true)
    }
    
    
}
