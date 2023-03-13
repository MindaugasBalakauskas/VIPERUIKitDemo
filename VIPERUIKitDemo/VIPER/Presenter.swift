//
//  Presenter.swift
//  VIPERUIKitDemo
//
//  Created by Mindaugas Balakauskas on 31/01/2023.
//

import Foundation

protocol AnyPresenter {
    var view: AnyView? {get set}
    var interactor: AnyInteractor? {get set}
    var router: AnyRouter? {get set}
    
    func intreactorDidFinishWithProducts(with result: Result<[Product], Error>)
    func showMeDetailsScreen(data: Product)
}

class ProductsPresenter: AnyPresenter {
    
    
    
    var view: AnyView?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getProductsFromAPI()
        }
    }
    
    var router: AnyRouter?
    
    func showMeDetailsScreen(data: Product) {
        router?.moveToDetailsScreen(data: data)
    }
    
    func intreactorDidFinishWithProducts(with result: Result<[Product], Error>) {
        switch result {
        case .success(let products):
            print(products)
            view?.update(with: products)
        case .failure(let error):
            print(error.localizedDescription)
            view?.update(with: error.localizedDescription)
        }
    }
    
}
