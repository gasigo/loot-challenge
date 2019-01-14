//
//  TransactionCell.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 14/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {
	@IBOutlet private weak var descriptionLabel: UILabel!
	@IBOutlet private weak var amountLabel: UILabel!
	@IBOutlet private weak var transactionTypeView: UIView!
	
	static let identifier = "TransactionCell"

	func configure(transaction: Transaction) {
		self.descriptionLabel.text = transaction.description
		self.amountLabel.text = transaction.amount.description
		self.transactionTypeView.backgroundColor = TransactionType(value: transaction.amount).color
	}
}

enum TransactionType {
	case credit
	case debit
	
	var color: UIColor {
		switch self {
		case .credit:
			return .green
		case .debit:
			return .red
		}
	}
	
	init(value: Double) {
		if value > 0 {
			self = .credit
		} else {
			self = .debit
		}
	}
}
