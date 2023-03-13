//
//  Interactor.swift
//  VIPERUIKitDemo
//
//  Created by Mindaugas Balakauskas on 31/01/2023.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func getProductsFromAPI()
}



class ProductsInteractor: AnyInteractor, NetworkMangerDelegate {
    
    
    var presenter: AnyPresenter?
    
    func getProductsFromAPI() {
        Task {
            do{
               let networkManager = NetworkManger()
                networkManager.delegate = self
                let url = URL(string: "https://dummyjson.com/products")!
                try await networkManager.getDataFromAPI(url: url)
            } catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
    func didFinishLoadingData(data: Data) async {
        do{
            let productsData = try JSONDecoder().decode(ProductData.self, from: data)
            presenter?.intreactorDidFinishWithProducts(with: .success(productsData.products))
        }catch{
            presenter?.intreactorDidFinishWithProducts(with: .failure(NetworkError.parsingError))
        }
        
        
    }
    
    func didFinishWithError(error: Error) async {
        presenter?.intreactorDidFinishWithProducts(with: .failure(NetworkError.dataNotFound))
    }
}
