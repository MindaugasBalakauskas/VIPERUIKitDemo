//
//  NetworkManager.swift
//  VIPERUIKitDemo
//
//  Created by Mindaugas Balakauskas on 31/01/2023.
//

import Foundation

protocol Networkable{
    func getDataFromAPI(url: URL) async throws -> Data
}

protocol NetworkMangerDelegate{
    func didFinishLoadingData(data:Data) async -> Void
    func didFinishWithError(error:Error) async -> Void
}

class NetworkManger{
    
    var delegate:NetworkMangerDelegate?
    
    func getDataFromAPI(url: URL) async throws {
        do{
           let (data,_)  = try await URLSession.shared.data(from: url)
            await delegate?.didFinishLoadingData(data: data)
        }catch{
            //.dataNotFound
            await delegate?.didFinishWithError(error: error)
            throw error
        }
    }
}

enum NetworkError:Error{
    case parsingError
    case apiError
    case dataNotFound
    case invalidURL
}
extension NetworkError: LocalizedError{
    
    var errorDescription :String?{
        switch self{
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .parsingError:
            return NSLocalizedString("parsing Error", comment: "parsingError")
        case .dataNotFound:
            return NSLocalizedString("Failed to get data from API", comment: "dataNotFound")
        case .apiError:
            return NSLocalizedString("apiError", comment: "apiError")

        }
    }
}
