//
//  TransactionsInteractor.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

protocol TransactionsInteractorProtocol {
	func getTransactions(callback: @escaping (Result<[Transaction]>) -> Void)
}

struct TransactionsInteractor: TransactionsInteractorProtocol {
	private let networkService: NetworkServiceProtocol
	
	init(networkService: NetworkServiceProtocol) {
		self.networkService = networkService
	}
	
	func getTransactions(callback: @escaping (Result<[Transaction]>) -> Void) {
		self.networkService.request(with: TransactionsRequestData.getTransactions, responseType: [Transaction].self) { result in
			switch result {
			case .success(let transactions):
				guard let transactions = transactions else {
					callback(.error(Errors.nilTransactions))
					return
				}
				
				callback(.success(transactions))
			case .error(let error):
				callback(.error(error))
			}
		}
	}
	
	private enum Errors: Error {
		case nilTransactions
	}
}
