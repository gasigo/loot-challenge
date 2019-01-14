//
//  TransactionsPresenter.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import Foundation

protocol TransactionsPresenterProtocol {
	func handleLoad(for view: TransactionsViewProtocol)
}

class TransactionsPresenter: TransactionsPresenterProtocol {
	private let interactor: TransactionsInteractorProtocol
	private weak var view: TransactionsViewProtocol!
	
	init(interactor: TransactionsInteractorProtocol) {
		self.interactor = interactor
	}
	
	func handleLoad(for view: TransactionsViewProtocol) {
		self.view = view
		self.view.startLoading()
		self.interactor.getTransactions { result in
			self.view.stopLoading()
			switch result {
			case .success(let transactions):
				guard let transactions = transactions else {
					return
				}
				
				let transactionsGroupByDate = self.group(transactions: transactions)
				var groupedTransactions = transactionsGroupByDate.map({ (key, value) -> GroupedTransaction in
					return GroupedTransaction(title: key, transactions: value)
				})
				
				groupedTransactions.sort(by: { $0.title > $1.title })
				self.view.load(transactions: groupedTransactions)
			case .error:
				self.view.showAlert(title: Constants.errorTitle.rawValue,
									message: Constants.errorMessage.rawValue)
			}
		}
	}
	
	private func group(transactions: [Transaction]) -> [String: [Transaction]] {
		return Dictionary(grouping: transactions) { transaction -> String in
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd"
			return formatter.string(from: transaction.date)
		}
	}
	
	enum Constants: String {
		case errorTitle = "Error"
		case errorMessage = "Could't fetch transactions data."
	}
}
