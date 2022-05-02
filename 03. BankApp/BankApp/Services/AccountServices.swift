//
//  AccountServices.swift
//  BankApp
//
//  Created by Luann Luna on 25/04/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class AccountService {
    
    // Prevent multiples initializations
    private init() { }
    
    static let shared = AccountService()
    
    func createAccount(createAccountRequest: CreateAccountRequest, completion: @escaping (Result<CreateAccountResponse, NetworkError>) -> Void) {
        guard let url = URL.urlForCreateAccounts() else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(createAccountRequest)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let createAccountResponse = try? JSONDecoder().decode(CreateAccountResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            return completion(.success(createAccountResponse))
        }.resume()
    }
    
    func getAllAccounts(completion: @escaping (Result<[Account]?, NetworkError>) -> Void) {
        guard let url = URL.urlForAccounts() else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let accounts = try? JSONDecoder().decode([Account].self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            return completion(.success(accounts))
        }
    }
    
    func transferFunds(transferFundsRequest: TransferAccountFundResquest, completion: @escaping (Result<TransferFundResponse, NetworkError>) -> Void) {
        guard let url = URL.urlForTransferFunds() else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(transferFundsRequest)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let transferFundResponse = try? JSONDecoder().decode(TransferFundResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            return completion(.success(transferFundResponse))
        }.resume()
    }
}
