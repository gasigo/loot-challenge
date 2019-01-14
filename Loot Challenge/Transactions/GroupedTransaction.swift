//
//  GroupedTransaction.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 14/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

struct GroupedTransaction {
	let title: String
	let transactions: [Transaction]
	
	init(title: String, transactions: [Transaction]) {
		self.title = title
		self.transactions = transactions
	}
}
