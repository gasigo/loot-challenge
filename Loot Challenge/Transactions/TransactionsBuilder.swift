//
//  TransactionsBuilder.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 14/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import UIKit

struct TransactionsBuilder {
	static func makeTransactionsView() -> UIViewController {
		let networkService = NetworkBuilder.makeNetworkService()
		let interactor = TransactionsInteractor(networkService: networkService)
		let presenter = TransactionsPresenter(interactor: interactor)
		return TransactionsView(presenter: presenter)
	}
}
