//
//  View.swift
//  VIPERUIKitDemo
//
//  Created by Mindaugas Balakauskas on 31/01/2023.
//

import Foundation

protocol AnyView {
    var presenter: AnyPresenter? {get set}
    
    func update(with products:[Product])
    func update(with error: String)
}
