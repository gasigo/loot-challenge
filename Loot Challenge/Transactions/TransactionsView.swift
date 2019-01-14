//
//  TransactionsView.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 14/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import UIKit
import MapKit

protocol TransactionsViewProtocol: class {
	func load(transactions: [GroupedTransaction])
	func showAlert(title: String, message: String)
	func startLoading()
	func stopLoading()
}

class TransactionsView: UIViewController, TransactionsViewProtocol {
	@IBOutlet private weak var tableView: UITableView!
	@IBOutlet weak var loadingView: UIActivityIndicatorView!
	private let presenter: TransactionsPresenter
	private var groupedTransactions: [GroupedTransaction] = []
	
	init(presenter: TransactionsPresenter) {
		self.presenter = presenter
		super.init(nibName: Constants.name.rawValue, bundle: .main)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.tableView.register(UINib(nibName: TransactionCell.identifier, bundle: .main),
								forCellReuseIdentifier: TransactionCell.identifier)
		self.tableView.tableFooterView = UIView()
		self.presenter.handleLoad(for: self)
    }
	
	func load(transactions: [GroupedTransaction]) {
		self.groupedTransactions = transactions
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	func showAlert(title: String, message: String) {
		DispatchQueue.main.async {
			let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: Constants.buttonTitle.rawValue, style: .cancel, handler: nil))
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	func startLoading() {
		DispatchQueue.main.async {
			self.loadingView.startAnimating()
		}
	}
	
	func stopLoading() {
		DispatchQueue.main.async {
			self.loadingView.stopAnimating()
		}
	}
	
	enum Constants: String {
		case buttonTitle = "OK"
		case name = "TransactionsView"
	}
}

extension TransactionsView: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return self.groupedTransactions.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.groupedTransactions[section].transactions.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let transactionCell =
			tableView.dequeueReusableCell(withIdentifier: TransactionCell.identifier,
																  for: indexPath) as? TransactionCell else {
			return UITableViewCell()
		}
		
		transactionCell.configure(transaction: self.groupedTransactions[indexPath.section].transactions[indexPath.row])
		return transactionCell
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return self.groupedTransactions[section].title
	}
}
