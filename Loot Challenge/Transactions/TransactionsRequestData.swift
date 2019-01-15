//
//  TransactionsRequestData.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

enum TransactionsRequestData: RequestData {
	case getTransactions
	
	var method: HTTPMethod {
		switch self {
		case .getTransactions:
			return .get
		}
	}
	
	var host: String {
		return "http://private-710eeb-lootiosinterview.apiary-mock.com"
	}
	
	var path: String {
		switch self {
		case .getTransactions:
			return "/transactions"
		}
	}
}
